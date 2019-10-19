#!/bin/bash -e

cat <<EOF | sudo tee /etc/apt/sources.list.d/debian.list &> /dev/null
deb http://httpredir.debian.org/debian testing main contrib non-free
deb-src http://httpredir.debian.org/debian testing main contrib non-free
EOF

sudo apt-get update -qq
