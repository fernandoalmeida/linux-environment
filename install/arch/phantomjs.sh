#!/bin/bash -e

version=2.1.1
file=phantomjs-$version-linux-x86_64.tar.bz2

pushd $(mktemp -d)
  wget -q https://bitbucket.org/ariya/phantomjs/downloads/$file
  tar -xjf $file
  sudo mv $file /opt/phantomjs
  sudo ln -sf /opt/phantomjs/bin/phantomjs /usr/local/bin/
popd
