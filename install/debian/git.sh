#!/bin/bash -e

sudo apt-get install -qqy git

ARG GIT_DELTA_VERSION=0.19.1
RUN ARCH=$(dpkg --print-architecture) && \
  wget "https://github.com/dandavison/delta/releases/download/${GIT_DELTA_VERSION}/git-delta_${GIT_DELTA_VERSION}_${ARCH}.deb" && \
  sudo dpkg -i "git-delta_${GIT_DELTA_VERSION}_${ARCH}.deb" && \
  rm "git-delta_${GIT_DELTA_VERSION}_${ARCH}.deb"

ln -sf $(pwd)/install/debian/git/gitconfig $HOME/.gitconfig
ln -sf $(pwd)/install/debian/git/gitignore_global $HOME/.gitignore_global
