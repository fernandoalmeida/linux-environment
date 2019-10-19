#!/bin/bash -e

version=1.13.0
file=sqlectron-$version.deb
repo=https://github.com/sqlectron/sqlectron-gui

pushd $(mktemp -d)
  curl -sLo $file $repo/releases/download/v$version/Sqlectron-$version.deb
  sudo dpkg -i $file
popd

sudo ln -sfn /opt/Sqlectron/Sqlectron /usr/bin/sqlectron
