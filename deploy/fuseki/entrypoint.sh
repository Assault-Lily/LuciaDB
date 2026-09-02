#!/bin/sh
## Licensed under the terms of http://www.apache.org/licenses/LICENSE-2.0
##
## The TDB2 database is baked into this image at build time from RDFs/*.ttl
## (see ../../deploy/fuseki/Dockerfile). Unlike earlier versions of this
## script, it is NOT rebuilt on every container start: this keeps startup
## fast and guarantees that the running dataset is an exact, reproducible
## match for the image tag/digest that was deployed.
##
## Whether the service is read-only is controlled entirely by config.ttl,
## not by command-line flags: no SPARQL Update / GSP-write / upload
## endpoints are defined there.

exec "$JAVA_HOME/bin/java" $JAVA_OPTIONS -jar "${FUSEKI_DIR}/${FUSEKI_JAR}" --conf "${FUSEKI_DIR}/config.ttl"
