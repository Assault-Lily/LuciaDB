## Licensed under the terms of http://www.apache.org/licenses/LICENSE-2.0
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

## Apache Jena Fuseki server Dockerfile.
##
## This builds a reduced footprint container AND bakes a read-only TDB2
## database from RDFs/*.ttl at build time. The resulting image is
## self-contained and immutable: the same image tag always serves the same
## data, and no data is (re)generated at container start.
##
## Build context MUST be the repository root (not this directory), because
## the RDFs/ directory is copied in relative to the repo root. See
## deploy/fuseki/docker-compose.yaml for an example.

## Base image / Jena version tracking is kept up to date automatically by
## Renovate (see renovate.json): the eclipse-temurin tag below and the
## JENA_VERSION build-args in docker-compose.yaml / fuseki-build.yml.
ARG JAVA_VERSION=21
ARG ALPINE_VERSION=3.24.1
ARG JENA_VERSION=""

# Internal, passed between stages.
ARG FUSEKI_DIR=/fuseki
ARG FUSEKI_JAR=jena-fuseki-server-${JENA_VERSION}.jar
ARG JAVA_MINIMAL=/opt/java-minimal

## ---- Stage: Download Fuseki and build a reduced-footprint JRE.
## NOTE: upstream jena-fuseki-docker switched from openjdk:*-alpine (removed
## from Docker Hub) to eclipse-temurin:*-alpine; we follow that here.
FROM eclipse-temurin:${JAVA_VERSION}-alpine AS base

ARG JAVA_MINIMAL
ARG JENA_VERSION
ARG FUSEKI_DIR
ARG FUSEKI_JAR
ARG REPO=https://repo1.maven.org/maven2
ARG JAR_URL=${REPO}/org/apache/jena/jena-fuseki-server/${JENA_VERSION}/${FUSEKI_JAR}

RUN [ "${JENA_VERSION}" != "" ] || { echo -e '\n**** Set JENA_VERSION ****\n' ; exit 1 ; }
RUN echo && echo "==== Docker build for Apache Jena Fuseki ${JENA_VERSION} ====" && echo

# Alpine: For objcopy used in jlink
RUN apk add --no-cache curl binutils

## -- Fuseki installed and runs in /fuseki.
WORKDIR $FUSEKI_DIR

## -- Download the jar file.
COPY deploy/fuseki/download.sh .
RUN chmod a+x download.sh

# Download, with check of the SHA1 checksum.
RUN ./download.sh --chksum sha1 "$JAR_URL"

## -- Make reduced Java JDK

## Provides locale data. Jdeps does not detect it because of SPI, so add it here.
ARG JDEPS_EXTRA="jdk.crypto.cryptoki,jdk.crypto.ec,jdk.localedata"

## Optional: comma-separated list of locale language tags to keep from
## jdk.localedata, e.g. "en,ja". We keep "en,ja" since RDF data and error
## messages are Japanese/English only; leave empty to include all locales.
ARG JDK_LOCALES="en,ja"

RUN \
  JDEPS="$(jdeps --multi-release base --print-module-deps --ignore-missing-deps ${FUSEKI_JAR})"  && \
  if [ -n "${JDK_LOCALES}" ] ; then LOCALE_OPT="--include-locales=${JDK_LOCALES}" ; else LOCALE_OPT="" ; fi && \
  jlink \
        --compress 2 --strip-debug --no-header-files --no-man-pages \
        --output "${JAVA_MINIMAL}" \
        --add-modules "${JDEPS},${JDEPS_EXTRA}" \
        ${LOCALE_OPT}

ADD deploy/fuseki/entrypoint.sh .
ADD deploy/fuseki/log4j2.properties .
ADD deploy/fuseki/config.ttl .

## ---- Stage: bake the TDB2 database from repository RDF data.
##
## Uses the same Fuseki jar + minimal JRE built in the "base" stage, so the
## loader (tdb2.tdbloader) and the server that will later read this database
## are guaranteed to be the exact same Jena version.
##
## Only RDFs/*.ttl (character/legion/media/taskforce instance data) is
## loaded here. IRIs/ (ontology) and constraints/ (SHACL shapes) are
## published separately as static files by the reverse proxy in front of
## Fuseki and are intentionally NOT part of the queryable dataset.
FROM base AS tdb2build

ARG FUSEKI_DIR
ARG FUSEKI_JAR
ARG JAVA_MINIMAL

ENV JAVA_HOME=${JAVA_MINIMAL}
ENV JAVA_OPTIONS="-XX:MaxRAM=900M"

WORKDIR $FUSEKI_DIR
RUN mkdir -p databases staging

COPY RDFs/ ${FUSEKI_DIR}/staging/RDFs/

RUN set -eu; \
    files="$(find "${FUSEKI_DIR}/staging" -maxdepth 2 -type f \( -name '*.rdf' -o -name '*.ttl' \))"; \
    [ -n "$files" ] || { echo 'No RDF files found under staging/RDFs' >&2; exit 1; }; \
    for f in $files; do \
      echo "Loading $f"; \
      "$JAVA_HOME/bin/java" $JAVA_OPTIONS -cp "${FUSEKI_DIR}/${FUSEKI_JAR}:/javalibs/*" tdb2.tdbloader --loader=parallel --loc "${FUSEKI_DIR}/databases" "$f"; \
    done

## ---- Stage: runtime image.
FROM alpine:${ALPINE_VERSION}

RUN apk add --no-cache curl

## Import ARGs
ARG JENA_VERSION
ARG JAVA_MINIMAL
ARG FUSEKI_DIR
ARG FUSEKI_JAR

COPY --from=base /opt/java-minimal /opt/java-minimal
COPY --from=base /fuseki /fuseki

# Pre-built, read-only TDB2 database from the tdb2build stage above.
COPY --from=tdb2build ${FUSEKI_DIR}/databases ${FUSEKI_DIR}/databases

WORKDIR $FUSEKI_DIR

ARG LOGS=${FUSEKI_DIR}/logs

ARG JENA_USER=fuseki
ARG JENA_GROUP=$JENA_USER
ARG JENA_GID=1000
ARG JENA_UID=1000

# Run as this user
# -H : no home directory
# -D : no password
RUN addgroup -g "${JENA_GID}" "${JENA_GROUP}" && \
    adduser "${JENA_USER}" -G "${JENA_GROUP}" -s /bin/ash -u "${JENA_UID}" -H -D

RUN \
    mkdir -p $LOGS && \
    chown -R "${JENA_USER}" ${FUSEKI_DIR} && \
    chmod a+x entrypoint.sh

## Default environment variables.
ENV \
    JAVA_HOME=${JAVA_MINIMAL}           \
    JAVA_OPTIONS="-XX:MaxRAM=900M"  \
    JENA_VERSION=${JENA_VERSION}        \
    FUSEKI_JAR="${FUSEKI_JAR}"          \
    FUSEKI_DIR="${FUSEKI_DIR}"

USER $JENA_USER

EXPOSE 3030

HEALTHCHECK --start-period=30s --interval=10s --timeout=5s --retries=6 \
    CMD curl -f "http://localhost:3030/sparql/query?query=ASK%20%7B%7D" || exit 1

ENTRYPOINT ["./entrypoint.sh" ]
CMD []
