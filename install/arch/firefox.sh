#!/bin/bash -e

sudo pacman -Sy firefox
ln -sfn $(pwd)/install/arch/firefox/settings.ini $HOME/.config/gtk-3.0/
