#!/bin/bash
echo "Preparing rvm"
source /usr/local/rvm/scripts/rvm

echo "Executing: $@"
exec "$@"
