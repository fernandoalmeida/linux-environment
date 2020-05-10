#!/bin/bash -e

curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env

rustup default stable
rustup component add rustfmt clippy
