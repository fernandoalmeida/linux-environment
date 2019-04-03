#!/bin/bash -le

sudo apt-get install -qqy awesome awesome-extra

mkdir -p $HOME/.config
ln -sfn $(pwd)/install/debian/awesome $HOME/.config/

sudo chmod a+s /sbin/shutdown
