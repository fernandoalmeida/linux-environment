#!/bin/bash -e

sudo add-apt-repository ppa:mkasberg/ghostty-ubuntu
sudo apt update
sudo apt install ghostty

# Register Ghostty as a terminal alternative
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/ghostty 50

# Select it as default
sudo update-alternatives --set x-terminal-emulator /usr/bin/ghostty

# For GNOME's "Open Terminal" actions (e.g., Nautilus right-click)
gsettings set org.gnome.desktop.default-applications.terminal exec 'ghostty'
gsettings set org.gnome.desktop.default-applications.terminal exec-arg '-e'
