#!/bin/bash -le

sudo pacman -Sy awesome

mkdir -p $HOME/.config
ln -sfn $(pwd)/install/arch/awesome $HOME/.config/
ln -sfn $(pwd)/install/arch/awesome/bash/keyboard-setup.sh $HOME/.bashrc.d/utils/

sudo chmod a+s /sbin/shutdown
