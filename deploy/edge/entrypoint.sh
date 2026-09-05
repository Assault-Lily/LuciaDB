#!/bin/sh
set -eu

last_update="${LAST_UPDATE:-unknown}"
printf '{\n  "last_update": "%s"\n}\n' "$last_update" \
    > /usr/share/nginx/html/last-update.json

if [ -n "${CF_CUSTOM_HOSTNAME_CHALLENGE_ID:-}" ] &&
   [ -n "${CF_CUSTOM_HOSTNAME_CHALLENGE_VALUE:-}" ]; then
    challenge_dir="/usr/share/nginx/html/.well-known/cf-custom-hostname-challenge"
    mkdir -p "$challenge_dir"
    printf '%s\n' "$CF_CUSTOM_HOSTNAME_CHALLENGE_VALUE" \
        > "$challenge_dir/$CF_CUSTOM_HOSTNAME_CHALLENGE_ID"
fi

if [ -n "${CF_CUSTOM_HOSTNAME_DCV_PATH:-}" ] &&
   [ -n "${CF_CUSTOM_HOSTNAME_DCV_VALUE:-}" ]; then
    case "$CF_CUSTOM_HOSTNAME_DCV_PATH" in
        /.well-known/acme-challenge/*) ;;
        *)
            echo "CF_CUSTOM_HOSTNAME_DCV_PATH must be under /.well-known/acme-challenge/" >&2
            exit 1
            ;;
    esac

    case "$CF_CUSTOM_HOSTNAME_DCV_PATH" in
        *..*)
            echo "CF_CUSTOM_HOSTNAME_DCV_PATH must not contain '..'" >&2
            exit 1
            ;;
    esac

    dcv_file="/usr/share/nginx/html$CF_CUSTOM_HOSTNAME_DCV_PATH"
    mkdir -p "$(dirname "$dcv_file")"
    printf '%s\n' "$CF_CUSTOM_HOSTNAME_DCV_VALUE" > "$dcv_file"
fi

exec nginx -g 'daemon off;'
