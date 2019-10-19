#!/bin/bash -e

echo <<EOF | sudo tee /etc/apt/sources.list.d/conkeror.list
deb     http://noone.org/conkeror-nightly-debs jessie main
deb-src http://noone.org/conkeror-nightly-debs jessie main
EOF

sudo apt-get update -qq
sudo apt-get install -qqy conkeror
ln -sf $(pwd)/install/conkeror/conkerorrc $HOME/.conkerorrc
