#!/bin/bash -e

file=zoom_x86_64.pkg.tar.xz

pushd $(mktemp -d)
  curl -sLo $file https://zoom.us/client/latest/$file
  sudo pacman -U $file
popd
