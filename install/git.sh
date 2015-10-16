#!/bin/bash -e

: ${GITVERSION:=2.6.1}
: ${PREFIX=/usr/local}

sudo apt-get install libexpat-dev libcurl4-gnutls-dev
pushd $(mktemp -d)
  wget -q https://www.kernel.org/pub/software/scm/git/git-${GITVERSION}.tar.gz
  tar -zxf git-${GITVERSION}.tar.gz
  cd git-${GITVERSION}
  make prefix=${PREFIX}
  sudo make prefix=${PREFIX} install
  ln -sf ${PREFIX}/bin/git /usr/bin/git
popd
