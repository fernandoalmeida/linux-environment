#!/bin/bash -e

sudo aura -Ay direnv

ln -nsf $(pwd)/install/arch/direnv/direnvrc $HOME/.bashrc.d/direnvrc
source $(pwd)/install/arch/direnv/direnvrc
