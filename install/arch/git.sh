#!/bin/bash -e

sudo pacman -Sy git

ln -sf $(pwd)/install/arch/git/gitconfig $HOME/.gitconfig
ln -sf $(pwd)/install/arch/git/gitignore_global $HOME/.gitignore_global
ln -sf $(pwd)/install/arch/git/commit-template $HOME/.commit-template
