#!/bin/bash -le

sudo pacman -Sy awesome

mkdir -p $HOME/.config
ln -sfn $(pwd)/install/arch/awesome $HOME/.config/

sudo chmod a+s /sbin/shutdown
