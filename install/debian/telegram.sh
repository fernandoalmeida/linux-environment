#!/bin/bash -e

pushd $(mktemp -d)
  wget -qO telegram.tar.xz https://tdesktop.com/linux
  sudo tar -xf telegram.tar.xz -C /opt
  sudo ln -sf /opt/Telegram/Telegram /usr/bin/telegram
popd
