#!/bin/sh -e

sudo apt-get install -qqy docker.io docker-compose
sudo usermod -aG docker `id -un`
cp -fr {$(pwd)/install/docker,}/etc/default/docker
