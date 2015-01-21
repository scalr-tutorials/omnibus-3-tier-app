#!/bin/bash
set -o errexit
set -o nounset
set -o xtrace

APP_NAME="scalr-demo-app"
APP_VERSION="fa624695f954dc8f12b03b8175c84ba5cf0dbce1"  # TODO

# Image
img="local/factory-${APP_NAME}"
docker build -t "${img}" .

# Working directories
pkgDir="$(pwd)/pkg"
scratchDir="/scratch/${APP_NAME}"

# Build
docker run --rm -it \
  -e APP_NAME="${APP_NAME}" \
  -e APP_VERSION="${APP_VERSION}" \
  -v "${scratchDir}:/var/cache/omnibus" \
  -v "${pkgDir}:/pkg" \
  "${img}"

