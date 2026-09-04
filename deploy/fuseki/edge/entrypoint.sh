#!/bin/sh
set -eu

if [ -n "${CF_CUSTOM_HOSTNAME_CHALLENGE_ID:-}" ] &&
   [ -n "${CF_CUSTOM_HOSTNAME_CHALLENGE_VALUE:-}" ]; then
    challenge_dir="/usr/share/nginx/html/.well-known/cf-custom-hostname-challenge"
    mkdir -p "$challenge_dir"
    printf '%s\n' "$CF_CUSTOM_HOSTNAME_CHALLENGE_VALUE" \
        > "$challenge_dir/$CF_CUSTOM_HOSTNAME_CHALLENGE_ID"
fi

exec nginx -g 'daemon off;'
