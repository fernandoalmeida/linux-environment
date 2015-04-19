#!/bin/bash -e

packages="
  wget
  curl
  lsb-release
  adduser
  ca-certificates
"

sudo apt-get install -qq --yes --force-yes $packages
