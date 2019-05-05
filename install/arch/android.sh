#!/bin/bash -e

sudo pacman -Sy android-tools
sudo aura -Ay android-studio

ln -sf $(pwd)/install/arch/android/bashrc ~/.bashrc.d/android

cat <<INSTRUCTIONS

* open android-studio
* in the opened wizard choose 'Custom' setup and check lastest version of:
  - Android SDK
  - Android SDK Platform
  - Android Virtual Device
* define the location as '$HOME/.android-sdk'
* install!
* create a virtual device with the lastest API version

References:
- https://facebook.github.io/react-native/docs/getting-started.html#2-install-the-android-sdk
- https://facebook.github.io/react-native/docs/running-on-device.html
- https://flutter.dev/docs/get-started/install/linux#android-setup

INSTRUCTIONS
