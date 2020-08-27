#!/usr/bin/env sh

envsubst '${DOMAIN_NAME}' < /etc/nginx/conf.d/nginx.conf.template > /etc/nginx/conf.d/default.conf

rm /etc/nginx/conf.d/nginx.conf.template
exec "$@"