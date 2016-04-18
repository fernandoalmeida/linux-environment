#!/bin/bash -e

build=/11.2.202.616/install_flash_player_11_linux.x86_64.tar.gz

pushd $(mktemp -d)
  wget -qO flash.tar.gz https://fpdownload.adobe.com/get/flashplayer/pdc/$build
  tar -zxf flash.tar.gz
  sudo cp libflashplayer.so  /usr/lib/mozilla/plugins/
  sudo cp -r usr/* /usr/
popd
