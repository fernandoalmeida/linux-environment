#!/bin/bash -e

pushd $(mktemp -d)
  git clone https://aur.archlinux.org/aura-git.git
  cd aura-git
  makepkg
  sudo pacman -U aura-git-*.tar.xz
popd
