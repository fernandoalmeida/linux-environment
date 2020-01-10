#!/bin/bash -e

sudo pacman -Sy ghc ghc-static cabal-install

cabal update

cabal install parsec
