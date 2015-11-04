#!/bin/bash -e

sudo apt-get install -qqy xfe
ln -sf $(pwd)/install/xfe $HOME/.config/xfe
