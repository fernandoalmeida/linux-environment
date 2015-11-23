#!/bin/bash -e

PKG=dropbox_2015.10.28_amd64.deb

sudo apt-get install -qq python-gpgme
pushd $(mktemp -d)
  wget -q https://linux.dropbox.com/packages/ubuntu/$PKG
  sudo dpkg -i $PKG
popd
dropbox start -i
