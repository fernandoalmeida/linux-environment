#!/bin/bash -e

pushd $(mktemp -d)
  gpg --keyserver hkp://keyserver.ubuntu.com --recv-keys 2EBF997C15BDA244B6EBF5D84773BD5E130D1D45
  gpg --keyserver hkp://keyserver.ubuntu.com --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90

  git clone https://aur.archlinux.org/spotify.git
  pushd spotify
    makepkg -sri
  popd
popd

sudo aura -A spotify-tray-git
