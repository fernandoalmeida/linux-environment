#!/bin/bash -e

sudo aura -Ay direnv

ln -nsf $(pwd)/install/arch/direnv/direnvrc $HOME/.bashrc.d/custom/direnvrc
source $(pwd)/install/arch/direnv/direnvrc
