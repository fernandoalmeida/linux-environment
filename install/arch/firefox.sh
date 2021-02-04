#!/bin/bash -e

sudo pacman -Sy firefox
mkdir -p $HOME/.config/gtk-3.0
ln -sfn $(pwd)/install/arch/firefox/settings.ini $HOME/.config/gtk-3.0/
