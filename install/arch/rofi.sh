#!/bin/bash -e

sudo pacman -Sy rofi rofi-calc
mkdir -p $HOME/.config/rofi/
ln -s $(pwd)/install/arch/rofi/config $HOME/.config/rofi/config
