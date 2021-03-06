#!/usr/bin/env bash

: ${RUBY_VERSION:="2.2.2"}
: ${RBENV_ROOT:="$HOME/.rbenv"}

packages="
    zlib1g
    zlib1g-dev
    libssl-dev
    libreadline6
    libreadline6-dev
    libyaml-dev
    libxml2-dev
    libxslt-dev
    libffi-dev
    build-essential
    openssl
"

sudo apt-get install -qqy $packages

git clone git://github.com/sstephenson/rbenv.git \
          $RBENV_ROOT

git clone git://github.com/sstephenson/ruby-build.git \
          $RBENV_ROOT/plugins/ruby-build

git clone git://github.com/sstephenson/rbenv-gem-rehash.git \
          $RBENV_ROOT/plugins/rbenv-gem-rehash

git clone git://github.com/carsomyr/rbenv-bundler.git \
          $RBENV_ROOT/plugins/rbenv-bundler

git clone git://github.com/jamis/rbenv-gemset.git \
          $RBENV_ROOT/plugins/rbenv-gemset

ln -sfn $(pwd)/install/bash/bashrc.d/ruby \
        $HOME/.bashrc.d/

source $(pwd)/install/bash/bashrc.d/ruby
rbenv install $RUBY_VERSION
rbenv global $RUBY_VERSION
