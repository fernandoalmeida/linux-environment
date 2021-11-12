#!/bin/bash -e

sudo pacman -Syy rustup

rustup default stable
rustup component add rustfmt clippy rls
