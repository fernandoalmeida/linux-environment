#!/bin/bash -e

curl -L https://fly.io/install.sh | sh

if [ -d $HOME/.bashrc.d/custom ]; then
    echo "adding bash config"
    ln -sf $(pwd)/install/debian/fly/fly.conf.sh $HOME/.bashrc.d/custom/
fi

if [ -d $HOME/.config/fish/conf.d/ ]; then
    echo "adding fish config"
    ln -sf $(pwd)/install/debian/fly/fly.conf.sh $HOME/.config/fish/conf.d/fly.conf.fish
fi

