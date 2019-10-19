#!/bin/bash -e

version=latest
lang=en-US

url="https://download.mozilla.org/?product=firefox-$version&os=linux64&lang=$lang"
file=firefox.tar.bz2
path=/opt/firefox

pushd $(mktemp -d)
  curl -sLo $file $url
  sudo rm -fr $path
  sudo tar -C /opt -jxf $file
  sudo rm -fr /usr/bin/firefox
  sudo ln -sfn $path/firefox /usr/bin/firefox
popd
