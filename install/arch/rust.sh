#!/bin/bash -e

sudo pacman -Sy rustup

rustup default stable
rustup component add rustfmt clippy
