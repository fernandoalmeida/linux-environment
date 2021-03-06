#!/bin/bash -e

version=1.2.1
file=flutter_linux_v$version-stable.tar.xz

pushd $(mktemp -d)
  curl https://storage.googleapis.com/flutter_infra/releases/stable/linux/$file -o flutter.tar.xz
  sudo tar -xf flutter.tar.xz -C /opt/
  sudo chown $USER -R /opt/flutter
popd

ln -sf $(pwd)/install/arch/flutter/bashrc $HOME/.bashrc.d/custom/flutter
source ~/.bashrc.d/custom/flutter

flutter packages pub global activate devtools

flutter doctor
