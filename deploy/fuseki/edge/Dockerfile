## Licensed under the terms of http://www.apache.org/licenses/LICENSE-2.0

FROM nginx:1.27-alpine

ARG LAST_UPDATE=unknown

COPY deploy/fuseki/edge/nginx.conf /etc/nginx/conf.d/default.conf
COPY IRIs /usr/share/nginx/html/rdf/IRIs
COPY constraints /usr/share/nginx/html/rdf/constraints

RUN printf '{\n  "last_update": "%s"\n}\n' "${LAST_UPDATE}" \
      > /usr/share/nginx/html/last-update.json

EXPOSE 8080

HEALTHCHECK --interval=10s --timeout=5s --retries=6 \
    CMD wget --quiet --spider http://127.0.0.1:8080/healthz || exit 1
