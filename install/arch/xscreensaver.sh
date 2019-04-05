#!/bin/bash -e

sudo pacman -Sy xscreensaver

# TODO: automate it
cat <<MESSAGE
run 'xscreensaver-demo' and maintain selected only the following screensavers:
- gl matrix
- cubic grid
- binary ring
MESSAGE
