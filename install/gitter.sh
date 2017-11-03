#!/bin/bash -e

repo=https://update.gitter.im/linux64
version=3.1.0
file=gitter_${version}_amd64.deb

pushd $(mktemp -d)
  curl -sLo $file $repo/$file
  sudo dpkg -i $file
popd
