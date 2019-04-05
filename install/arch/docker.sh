#!/bin/bash -e

sudo pacman -Sy docker docker-compose
sudo usermod -a -G docker `id -un`

sudo systemctl enable docker
sudo systemctl start docker

echo "Reboot the system to apply the user profile changes"
