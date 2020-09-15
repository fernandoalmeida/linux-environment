#!/bin/bash -e

sudo pacman -Sy stack

pushd $(mktemp -d)
  git clone https://aur.archlinux.org/aura-git.git
  cd aura-git
  makepkg
  sudo pacman -U aura-git-*.tar.*
popd
