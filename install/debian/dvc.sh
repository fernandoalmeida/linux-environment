#!/bin/bash

pushd $(mktemp -d)
  wget -qO dvc.deb https://dvc.org/download/linux-deb/dvc-3.59.1
  sudo dpkg -i dvc.deb
  sudo apt install -qqyf
popd
