#!/bin/bash -e

: ${EMACS_DOTFILES:='https://github.com/fernandoalmeida/.emacs.d.git'}

sudo apt-get install -qqy emacs

ln -sfn $(pwd)/install/bash/bashrc.d/emacs $HOME/.bashrc.d/

# download and configure my Emacs dotfiles
if [ ! -d $HOME/.emacs.d ] ; then
  git clone $EMACS_DOTFILES $HOME/.emacs.d
fi

pushd "$HOME/.emacs.d"
  git submodule init
  git submodule update
popd
