#!/bin/bash -e

sudo apt-get install -qq direnv

ln -nsf $(pwd)/install/arch/direnv/direnvrc $HOME/.bashrc.d/direnvrc
source $(pwd)/install/arch/direnv/direnvrc
