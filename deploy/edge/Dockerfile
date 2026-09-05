## Licensed under the terms of http://www.apache.org/licenses/LICENSE-2.0

FROM nginx:1.31-alpine

COPY deploy/edge/nginx.conf /etc/nginx/conf.d/default.conf
COPY deploy/edge/entrypoint.sh /usr/local/bin/edge-entrypoint.sh
COPY IRIs /usr/share/nginx/html/rdf/IRIs
COPY constraints /usr/share/nginx/html/rdf/constraints

RUN chmod +x /usr/local/bin/edge-entrypoint.sh

EXPOSE 8080

HEALTHCHECK --interval=10s --timeout=5s --retries=6 \
    CMD wget --quiet --spider http://127.0.0.1:8080/healthz || exit 1

ENTRYPOINT ["/usr/local/bin/edge-entrypoint.sh"]
