#!/bin/bash -e

mkdir -p $HOME/.bashrc.d/
ln -sf $(pwd)/install/bash/bashrc.d $HOME/.bashrc.d
ln -sf $(pwd)/install/bash/bashrc $HOME/.bashrc
ln -sf $(pwd)/install/bash/inputrc $HOME/.inputrc
