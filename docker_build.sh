#!/bin/bash
set -o errexit
set -o nounset

# Remove old packages
rm -f "${OMNIBUS_PACKAGE_DIR}"/*

# Now, trigger the build
echo "Building: ${APP_NAME}-${APP_VERSION}"
cd /builder && bin/omnibus build "${APP_NAME}"

echo "Done!"
