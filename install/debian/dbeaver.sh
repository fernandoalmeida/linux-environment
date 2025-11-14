#!/bin/bash -e

PKG=dbeaver-ce_latest_amd64.deb

pushd $(mktemp -d)
  wget -q https://dbeaver.io/files/$PKG
  sudo dpkg -i $PKG  
popd
