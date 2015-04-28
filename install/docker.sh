#!/bin/sh -e

#
## Docker
#
wget -qO- https://get.docker.com/ | sh
sudo usermod -aG docker $USER

#
## Compose
#
sudo curl -L https://github.com/docker/compose/releases/download/1.2.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
