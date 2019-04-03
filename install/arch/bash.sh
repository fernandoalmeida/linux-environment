#!/bin/bash -e

sudo pacman -Sy rxvt-unicode bash-completion

if [[ -d $HOME/.bashrc.d ]]; then
    mv $HOME/.bashrc.d{,.bkp-$(date --iso-8601=seconds)}
fi

ln -nsf $(pwd)/install/arch/bash/bashrc.d $HOME/.bashrc.d
ln -sf $(pwd)/install/arch/bash/bashrc $HOME/.bashrc
ln -sf $(pwd)/install/arch/bash/inputrc $HOME/.inputrc
ln -sf $(pwd)/install/arch/bash/Xresources $HOME/.Xresources
