#!/bin/bash -e

sudo apt-get install -y conkeror
ln -sf $(pwd)/install/conkeror/conkerorrc $HOME/.conkerorrc
