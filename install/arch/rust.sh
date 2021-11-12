#!/bin/bash -e

sudo pacman -Syy rustup

rustup default stable
rustup component add rustfmt clippy rls

# Emacs integration required tooling
rustup toolchain add nightly
rustup component add rust-src
cargo +nightly install racer
