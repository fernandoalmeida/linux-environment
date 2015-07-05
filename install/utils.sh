#!/bin/sh -e

packages="
  wget
  curl
  lsb-release
  adduser
  ca-certificates
  apt-utils
  htop
"

sudo apt-get install -qq --yes --force-yes $packages
