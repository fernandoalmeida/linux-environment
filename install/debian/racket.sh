#!/bin/bash -e

version=6.6
repo=https://mirror.racket-lang.org/installers
file=racket-$version-x86_64-linux.sh

pushd $(mktemp -d)
  curl -so $file $repo/$version/$file
  chmod +x $file
  sudo ./$file \
       --unix-style \
       --dest /usr/local/
popd
