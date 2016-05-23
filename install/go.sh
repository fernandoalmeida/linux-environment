#!/bin/bash -e
: ${GOVERSION:="1.6.2"}

pushd $(mktemp -d)
  [ -d /usr/local/go ] && sudo rm -fr /usr/local/go

  wget -q \
       https://storage.googleapis.com/golang/go$GOVERSION.linux-amd64.tar.gz

  sudo tar -C /usr/local -xzf go$GOVERSION.linux-amd64.tar.gz
  sudo ln -nsf /usr/local/go/bin/go /usr/bin/go
popd

ln -nsf $(pwd)/install/go/bashrc $HOME/.bashrc.d/go
