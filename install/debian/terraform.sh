#!/bin/bash -e

version=0.10.7
file=terraform_${version}_linux_amd64.zip

pushd $(mktemp -d)
  curl -qso $file https://releases.hashicorp.com/terraform/$version/$file
  sudo unzip $file -d /usr/bin/
popd
