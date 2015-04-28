#!/bin/sh -e

sudo apt-get install git-core --yes --force-yes -qq
ln -sfn $(pwd)/dotfiles/bashrc.d/git $HOME/.bashrc.d/
