#!/bin/bash -e

sudo pacman -Sy elixir

# language server
pushd $(mktemp -d)
   git clone https://aur.archlinux.org/elixir-ls.git
   makepkg -si
   ln -sf /usr/lib/elixir-ls/language_server.sh /usr/local/bin/
popd
