#!/bin/bash -e

pushd $(mktemp -d)
  wget -qO telegram.tar.xz https://telegram.org/dl/desktop/linux
  sudo tar -xf telegram.tar.xz -C /opt
  sudo ln -sf /opt/Telegram/Telegram /usr/bin/telegram
popd
