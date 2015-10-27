#!/bin/bash -le

sudo apt-get install -qqy awesome awesome-extra

ln -sfn $(pwd)/dotfiles/config/awesome $HOME/.config/

sudo chmod a+s /sbin/shutdown
