#!/bin/bash -e

if [[ -d $HOME/.bashrc.d ]]; then
    mv $HOME/.bashrc.d{,.bkp-$(date --iso-8601=seconds)}
fi

ln -nsf $(pwd)/install/bash/bashrc.d $HOME/.bashrc.d
ln -sf $(pwd)/install/bash/bashrc $HOME/.bashrc
ln -sf $(pwd)/install/bash/inputrc $HOME/.inputrc
