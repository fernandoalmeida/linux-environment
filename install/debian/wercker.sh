#!/bin/bash -e

f=https://s3.amazonaws.com/downloads.wercker.com/cli/stable/linux_amd64/wercker

pushd $(mktemp -d)
  curl -sqLo wercker $f
  chmod +x wercker
  sudo mv wercker /usr/local/bin/
popd
