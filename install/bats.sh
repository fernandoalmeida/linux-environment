#!/bin/bash -e

pushd $(mktemp -d)
    git clone https://github.com/sstephenson/bats.git
    sudo ./bats/install.sh /usr/local
popd
