#!/bin/bash -e

# The recommend way to install Haskell on your computer is through the
# Haskell Platform (https://wiki.haskell.org/Implementations)
sudo apt-get install -qqy haskell-platform
ln -sf $(pwd)/install/haskell/haskellrc $HOME/.bashrc.d/

if [ ! -f $HOME/.cabal/packages/hackage.haskell.org/00-index.cache ] ; then
    cabal update
fi

command -v stylish-haskell || cabal install stylish-haskell
command -v happy || cabal install happy
command -v hasktags || cabal install hasktags

ln -sf $(pwd)/install/haskell/stylish-haskell.yaml $HOME/.stylish-haskell.yaml
