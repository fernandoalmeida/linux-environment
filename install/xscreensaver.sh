#!/bin/bash -e

sudo apt-get install -qqy xscreensaver-gl xscreensaver-gl-extra
rm -f $HOME/.xscreensaver
ln -sf $(pwd)/install/xscreensaver/xscreensaver $HOME/.xscreensaver
