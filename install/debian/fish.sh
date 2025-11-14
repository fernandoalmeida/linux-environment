#!/bin/bash -e

sudo apt install -qqy fish
echo /usr/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/bin/fish
# sudo usermod --shell /usr/bin/fish $USER
