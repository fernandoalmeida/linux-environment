#!/bin/bash -e

sudo apt-get install -qqy cmigemo

sudo pip install percol

mkdir -p ~/.percol.d
ln -sfn $(pwd)/install/percol/rc.py $HOME/.percol.d/rc.py
