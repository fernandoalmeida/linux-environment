#!/bin/bash

pushd $(mktemp -d)
  wget -qO zoom.deb https://zoom.us/client/latest/zoom_amd64.deb
  sudo dpkg -i zoom.deb
  sudo apt install -qqyf
popd
