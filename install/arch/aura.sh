#!/bin/bash -e

pushd $(mktemp -d)
  git clone https://aur.archlinux.org/aura-bin.git
  cd aura-bin
  makepkg
  sudo pacman -U aura-bin-*.tar.xz
popd
