#!/bin/bash -e

sudo aura -Ay nvm
ln -sfn $(pwd)/install/arch/nvm/nvmrc $HOME/.bashrc.d/
