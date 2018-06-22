#!/bin/bash -e

pushd $(mktemp -d)
  git clone https://aur.archlinux.org/aura.git
  cd aura
  makepkg -si
popd
