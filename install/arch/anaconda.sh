#!/bin/bash -e

# documentation:
# https://docs.anaconda.com/anaconda/install/linux/

: ${ANACONDA_VERSION:="2020.07"}

sudo pacman -Sy \
     libxau \
     libxi \
     libxss \
     libxtst \
     libxcursor \
     libxcomposite \
     libxdamage \
     libxfixes \
     libxrandr \
     libxrender \
     mesa-libgl \
     alsa-lib \
     libglvnd

pushd $(mktemp -d)
  curl -sqLo installer.sh https://repo.anaconda.com/archive/Anaconda3-$ANACONDA_VERSION-Linux-x86_64.sh
  chmod +x installer.sh
  bash installer.sh -b -p $HOME/.anaconda3
popd

ln -sf $(pwd)/install/arch/anaconda/anacondarc $HOME/.bashrc.d/custom/anacondarc
source $(pwd)/install/arch/anaconda/anacondarc
