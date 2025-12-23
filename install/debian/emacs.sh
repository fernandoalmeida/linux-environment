#!/bin/bash -e

: ${EMACS_DOTFILES:='https://github.com/fernandoalmeida/emacs.d.git'}

sudo apt-get install -qqy emacs

pushd $(mktemp -d)
  wget -qO emacs-lsp-booster.zip https://github.com/blahgeek/emacs-lsp-booster/releases/download/v0.2.1/emacs-lsp-booster_v0.2.1_x86_64-unknown-linux-musl.zip
  unzip emacs-lsp-booster.zip
  mv emacs-lsp-booster $HOME/.local/bin/
popd

# download and configure my Emacs dotfiles
if [ ! -d $HOME/.emacs.d ] ; then
  git clone $EMACS_DOTFILES $HOME/.emacs.d
fi

pushd "$HOME/.emacs.d"
  git submodule init
  git submodule update
popd
