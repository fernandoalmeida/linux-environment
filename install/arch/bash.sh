#!/bin/bash -e

sudo pacman -Sy rxvt-unicode  bash-completion
sudo aura -Ay urxvt-resize-font-git

mkdir -p $HOME/.bashrc.d/custom $HOME/.bashrc.d/utils

for f in $(find $(pwd)/install/arch/bash/bashrc.d/custom -not -type d); do
    ln -sf $f $HOME/.bashrc.d/custom/
done

for f in $(find $(pwd)/install/arch/bash/bashrc.d/utils -not -type d); do
    ln -sf $f $HOME/.bashrc.d/utils/
done

ln -sf $(pwd)/install/arch/bash/bashrc $HOME/.bashrc
ln -sf $(pwd)/install/arch/bash/inputrc $HOME/.inputrc
ln -sf $(pwd)/install/arch/bash/Xresources $HOME/.Xresources
