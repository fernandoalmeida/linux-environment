#!/bin/bash -e

VERSION=0.16.7

pushd $(mktemp -d)
  wget -qO asdf.tar.gz https://github.com/asdf-vm/asdf/releases/download/v$VERSION/asdf-v$VERSION-linux-amd64.tar.gz
  tar -zxvf asdf.tar.gz
  mv asdf $HOME/.local/bin/
popd

if [ -d $HOME/.bashrc.d/custom ]; then
    echo "adding bash config"
    ln -sf $(pwd)/install/debian/asdf/asdf.conf.sh $HOME/.bashrc.d/custom/
fi

if [ -d $HOME/.config/fish/conf.d/ ]; then
    echo "adding fish config"
    ln -sf $(pwd)/install/debian/asdf/asdf.conf.sh $HOME/.config/fish/conf.d/asdf.conf.fish
fi

export ASDF_DATA_DIR="$HOME/.asdf"
export PATH="$ASDF_DATA_DIR/shims:$PATH"

$HOME/.local/bin/asdf plugin add erlang
$HOME/.local/bin/asdf plugin add elixir
$HOME/.local/bin/asdf plugin add nodejs
$HOME/.local/bin/asdf plugin add python
