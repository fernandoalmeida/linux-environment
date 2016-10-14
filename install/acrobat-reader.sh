#!/bin/bash -e

version=9.5.5
file=AdbeRdr$version-1_i386linux_enu.deb
repo=ftp://ftp.adobe.com/pub/adobe/reader/unix/${version:0:1}.x/${version}/enu/

pushd $(mktemp -d)
  curl -so $file $repo/$file
  sudo dpkg -i $file
popd
