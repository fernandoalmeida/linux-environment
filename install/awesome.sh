#!/bin/bash -le

sudo add-apt-repository --yes ppa:klaus-vormweg/awesome
sudo apt-get -qq update
sudo apt-get install -qqy awesome awesome-extra

ln -sfn $(pwd)/dotfiles/config/awesome $HOME/.config/

sudo chmod a+s /sbin/shutdown
