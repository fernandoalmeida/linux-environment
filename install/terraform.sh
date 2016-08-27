#!/bin/bash -e

version=0.7.2
file=terraform_${version}_linux_amd64.zip

pushd $(mktemp -d)
  curl -qso $file https://releases.hashicorp.com/terraform/$version/$file
  sudo unzip $file -d /usr/bin/
popd
