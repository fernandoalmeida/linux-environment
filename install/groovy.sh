#!/bin/bash -e

curl -s http://get.sdkman.io | bash
source "${HOME}/.sdkman/bin/sdkman-init.sh"
sdk install groovy

ln -sf $(pwd)/install/groovy/groovyrc $HOME/.bashrc.d/
