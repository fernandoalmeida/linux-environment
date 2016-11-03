#!/bin/bash -e

os=`uname -s`
arch=`uname -m`
machine_repo=https://github.com/docker/machine/releases/download/
machine_version=0.8.2
machine_file=docker-machine-$os-$arch

sudo apt-get install -qqy docker.io docker-compose
sudo usermod -aG docker `id -un`
sudo cp -fr {$(pwd)/install/docker,}/etc/default/docker

pushd $(mktemp -d)
  curl -sqLo docker-machine $machine_repo/v$machine_version/$machine_file
  chmod +x docker-machine
  sudo mv docker-machine /usr/local/bin/
popd
