#!/bin/bash -e

sudo pacman -Sy firefox
ln -sfn $(pwd)/install/arch/nvm/nvmrc $HOME/.bashrc.d/
