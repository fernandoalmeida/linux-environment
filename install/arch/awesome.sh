#!/bin/bash -le

sudo pacman -Sy awesome

mkdir -p $HOME/.config
ln -sfn $(pwd)/install/arch/awesome $HOME/.config/
echo awesome > $HOME/.xinitrc
# TODO: change "echo xinitrc" to "ln xinitrc"
# TODO: add keyboard setup on xinitrc
# ln -sfn $(pwd)/install/arch/awesome/xinitrc $HOME/.xinitrc

sudo chmod a+s /sbin/shutdown
