#!/bin/bash -e

sudo apt-get install -qqy git
ln -sf $(pwd)/install/git/gitconfig $HOME/.gitconfig
ln -sf $(pwd)/install/git/gitignore_global $HOME/.gitignore_global
