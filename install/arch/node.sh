#!/bin/bash -e

sudo aura -Ay nvm

ln -sfn $(pwd)/install/arch/node/nvmrc $HOME/.bashrc.d/custom/
source $(pwd)/install/arch/node/nvmrc

nvm install stable
nvm alias default stable
