#!/bin/bash -e

pushd $(mktemp -d)
  wget -q https://lastpass.com/lplinux.tar.bz2
  tar -xjvf lplinux.tar.bz2
  cd lplinux && ./install_lastpass.sh
popd
