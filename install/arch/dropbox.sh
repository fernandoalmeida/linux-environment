#!/bin/bash -e

cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -

cat <<MESSAGE
If you have a permission error on startup, see the documentation
https://help.dropbox.com/syncing-uploads/stuck-syncing#permission

sudo chown -R "$USER" ~/Dropbox ~/.dropbox
sudo chattr -R -i ~/Dropbox
sudo chmod -R u+rw ~/Dropbox ~/.dropbox
MESSAGE
