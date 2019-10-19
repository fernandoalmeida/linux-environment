#!/bin/bash -e

echo "deb http://download.virtualbox.org/virtualbox/debian wily contrib" \
    | sudo tee /etc/apt/sources.list.d/virtualbox.list &>/dev/null

wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- \
    | sudo apt-key add -

sudo apt-get update

sudo apt-get install virtualbox-5.0 dkms linux-headers-amd64
