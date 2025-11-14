#!/bin/bash -e

sudo apt install -qqy docker.io docker-compose-v2

sudo groupadd docker
sudo usermod -aG docker $USER

echo "Log out and log back in or run 'newgrp docker' to activate the group without logging out"
