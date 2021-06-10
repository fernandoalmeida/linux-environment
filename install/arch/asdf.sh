#!/bin/bash -e

sudo aura -A asdf-vm

ln -sf /opt/asdf-vm/asdf.sh $HOME/.bashrc.d/utils/
source /opt/asdf-vm/asdf.sh

asdf plugin-add erlang
asdf plugin-add elixir
