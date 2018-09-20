#!/bin/bash -e

: ${EMACS_DOTFILES:='https://github.com/fernandoalmeida/.emacs.d.git'}

sudo pacman -Sy emacs \
                aspell aspell-en aspell-pt \
                the_silver_searcher

ln -sfn $(pwd)/install/arch/emacs/emacsrc $HOME/.bashrc.d/

if [ ! -d $HOME/.emacs.d ] ; then
  git clone $EMACS_DOTFILES $HOME/.emacs.d
fi

pushd "$HOME/.emacs.d"
  git submodule init
  git submodule update
popd
