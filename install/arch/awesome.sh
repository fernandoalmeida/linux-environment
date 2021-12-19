#!/bin/bash -le

sudo pacman -Sy awesome

mkdir -p $HOME/.config
ln -sfn $(pwd)/install/arch/awesome $HOME/.config/
echo awesome > $HOME/.xinitrc

sudo chmod a+s /sbin/shutdown
