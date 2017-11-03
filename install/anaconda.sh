#!/bin/bash -e

script=https://repo.continuum.io/archive/Anaconda2-4.3.1-Linux-x86_64.sh

pushd $(mktemp -d)
  curl -sSLo anaconda.sh $script
  chmod +x anaconda.sh
  sudo ./anaconda.sh
popd
