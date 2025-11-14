#!/bin/bash -e

pushd $(mktemp -d)
  wget -qO discord.deb https://discord.com/api/download?platform=linux&format=deb
  sudo dpkg -i discord.deb
popd
