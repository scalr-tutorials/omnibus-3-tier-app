#!/bin/bash
set -o errexit
set -o nounset

# Now, trigger the build
# TODO - export APP_NAME="scalr-demo-app"
# TODO - export APP_VERSION
echo "Building: ${APP_NAME}-${APP_VERSION}"
cd /builder && bin/omnibus build "${APP_NAME}"

echo "Done!"
