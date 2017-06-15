#!/bin/bash -e

repo=https://downloads.preyproject.com/prey-client-releases/node-client/
version=1.6.8
file=prey_${version}_amd64.deb

pushd $(mktemp -d)
  curl -sLo $file $repo/$version/$file
  sudo dpkg -i --force-depends $file
  sudo apt-get install -qqyf
popd
