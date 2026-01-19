#!/bin/sh
set -e

crond
exec nginx -g "daemon off;"
