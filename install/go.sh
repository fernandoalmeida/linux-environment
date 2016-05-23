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
source $(pwd)/install/go/bashrc

# gocode is used by many editors to provide intellisense
go get github.com/nsf/gocode

# oracle is a tool that help with code navigation and search
go get golang.org/x/tools/cmd/oracle

# golint should be run after every build to check the code
go get github.com/golang/lint/golint
