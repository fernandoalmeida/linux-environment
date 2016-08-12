#!/bin/bash -e

pushd $(mktemp -d)
  curl -sk https://www.rescuetime.com/installers/rescuetime_current_amd64.deb
  sudo dpkg -i rescuetime_current_amd64.deb
popd
