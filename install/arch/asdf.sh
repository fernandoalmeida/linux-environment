#!/bin/bash -e

sudo aura -A asdf-vm

ln -sf $(pwd)/install/arch/asdf/asdfrc $HOME/.bashrc.d/custom/
source /opt/asdf-vm/asdf.sh

asdf plugin-add erlang
asdf plugin-add elixir
