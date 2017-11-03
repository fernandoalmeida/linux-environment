#!/bin/bash -e

sudo apt-get install -qq direnv

ln -nsf $(pwd)/install/direnv/direnvrc $HOME/.bashrc.d/direnvrc
source $(pwd)/install/direnv/direnvrc
