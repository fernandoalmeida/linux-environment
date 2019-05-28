#!/bin/bash -e

: ${EMACS_DOTFILES:='git@github.com:fernandoalmeida/.emacs.d.git'}

sudo pacman -Sy emacs

ln -sfn $(pwd)/install/arch/emacs/emacsrc $HOME/.bashrc.d/custom/

if [ ! -d $HOME/.emacs.d ] ; then
  git clone $EMACS_DOTFILES $HOME/.emacs.d
fi

pushd "$HOME/.emacs.d"
  git submodule init
  git submodule update
popd
