#!/bin/bash -e

repo=https://github.com/RocketChat/Rocket.Chat.Electron
version=1.3.1
file=rocketchat-v$version-linux-x64.deb

pushd $(mktemp -d)
  curl -sLo $file $repo/releases/download/$version/$file
  sudo dpkg -i $file

  sudo ln -nsf /opt/rocketchat/rocketchat /usr/bin/rocketchat
popd
