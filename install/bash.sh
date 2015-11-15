#!/bin/bash -e

mkdir -p $HOME/.bashrc.d

for f in $(pwd)/install/bash/bashrc.d/* ; do ln -sf $f $HOME/.bashrc.d/ ; done
ln -sf $(pwd)/install/bash/bashrc $HOME/.bashrc
ln -sf $(pwd)/install/bash/inputrc $HOME/.inputrc
