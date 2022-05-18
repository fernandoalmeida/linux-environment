#!/bin/bash -e

sudo pacman -Sy python-lsp-server
sudo ln -sf /usr/bin/pylsp /usr/bin/pyls
