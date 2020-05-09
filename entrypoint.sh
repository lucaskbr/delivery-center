#!/bin/bash
set -e

cd /delivery-center

if [ -e Gemfile ]; then
  bundle check || bundle install
fi

if [ -e /delivery-center/tmp/pids/server.pid ]; then
  rm /delivery-center/tmp/pids/server.pid
fi

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"