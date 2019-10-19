#!/bin/bash -e

curl -qqo- https://raw.githubusercontent.com/creationix/nvm/master/install.sh \
    | bash

ln -sfn $(pwd)/install/nodejs/bashrc $HOME/.bashrc.d/nodejsrc
source $(pwd)/install/nodejs/bashrc

nvm install stable
nvm alias default stable
