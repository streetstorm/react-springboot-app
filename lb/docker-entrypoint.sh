#!/usr/bin/env sh
set -eu

envsubst '${FRONTEND_HOST} ${FRONTEND_PORT}' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

exec "$@"
