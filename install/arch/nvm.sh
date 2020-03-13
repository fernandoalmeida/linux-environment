#!/bin/bash -e

sudo aura -Ay nvm

# language server
sudo npm i -g typescript-language-server
sudo npm i -g typescript

ln -sfn $(pwd)/install/arch/nvm/nvmrc $HOME/.bashrc.d/custom/
