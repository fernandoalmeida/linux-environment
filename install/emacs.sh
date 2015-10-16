#!/usr/bin/env bash

: ${EMACS_VERSION:="24.4"}
: ${TMP:="$(pwd)/tmp"}
: ${EMACS_DIR:="$TMP/emacs-$EMACS_VERSION"}
: ${EMACS_DOTFILES_REPO:='https://github.com/fernandoalmeida/.emacs.d.git'}

packages="
  build-essential
  libncurses5
  libncurses5-dev
  libxaw7-dev
  libgif-dev
  libjpeg-dev
  libpng-dev
  libtiff-dev
"

ruby_gems="
  rubocop
"

# install dependencies
sudo apt-get install -qq --yes --force-yes $packages
sudo apt-get build-dep emacs24 --yes --force-yes -qq

# download and install Emacs (latest) via source code
wget http://ftp.gnu.org/gnu/emacs/emacs-$EMACS_VERSION.tar.gz -nc -P $TMP
tar -C $TMP -zxvf $TMP/emacs-$EMACS_VERSION.tar.gz
cd $EMACS_DIR && ./configure && make && sudo make install
ln -sfn $(pwd)/dotfiles/bashrc.d/emacs $HOME/.bashrc.d/
gem install $ruby_gems

# download and configure my Emacs dotfiles
git clone $EMACS_DOTFILES_REPO $HOME/.emacs.d
