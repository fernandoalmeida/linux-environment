#!/bin/sh -e

sudo pacman -Sy lua luarocks vicious
sudo luarocks install busted
