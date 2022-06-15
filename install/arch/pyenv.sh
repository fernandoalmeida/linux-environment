#!/bin/bash -e

curl https://pyenv.run | bash

ln -sf $(pwd)/install/arch/pyenv/pyenvrc $HOME/.bashrc.d/custom/pyenvrc
source $(pwd)/install/arch/pyenv/pyenvrc
