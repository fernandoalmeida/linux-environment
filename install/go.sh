#!/bin/bash -e
: ${GOVERSION:="1.5.1"}

pushd $(mktemp -d)
  wget -q \
     https://storage.googleapis.com/golang/go$GOVERSION.linux-amd64.tar.gz
  sudo tar -C /usr/local -xzf go$GOVERSION.linux-amd64.tar.gz
popd

ln -nsf $(pwd)/install/go/bashrc $HOME/.bashrc.d/go
