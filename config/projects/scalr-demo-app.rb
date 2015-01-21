#
# Copyright 2015 Scalr, Inc.
#
# All Rights Reserved.
#

name "scalr-demo-app"
maintainer "Thomas Orozco"
homepage "https://github.com/scalr-tutorials/3-tier-app"

build_version ENV['APP_VERSION']

build_iteration 1

install_dir "#{default_root}/#{name}"


# Creates required build directories
dependency "prepare"

# 3-tier-app dependencies/components
dependency 'gunicorn'
dependency '3-tier-app'

# Version manifest file
dependency "version-manifest"

exclude "**/.git"
exclude "**/bundler/git"
