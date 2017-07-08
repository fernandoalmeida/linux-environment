#!/bin/bash -e

version=2.3.3.0
file=android-studio-ide-162.4069837-linux.zip

sudo apt-get install -y \
     libc6:i386 \
     libncurses5:i386 \
     libstdc++6:i386 \
     lib32z1 \
     libbz2-1.0:i386

pushd $(mktemp -d)
  wget -O android-studio.zip \
       https://dl.google.com/dl/android/studio/ide-zips/$version/$file

  sudo ln -sf /opt/android-studio/bin/studio.sh /usr/bin/android-studio

  cat <<__EOF

  open android-studio
  choose a 'Custom' setup and check:
  - Android SDK
  - Android SDK Platform
  - Android Virtual Device
  define the location as '$HOME/.android-sdk'
  install!

  go to 'SDK Manager' and check:
  - Android 6.0 (Marshmallow)
  ** Google APIs
  ** Android SDK Platform 23
  ** Intel x86 Atom_64 System Image
  ** Google APIs Intel x86 Atom_64 System Image
  go to 'SDK Tools' and check:
  - Android Emulator
  - Android SDK Build-Tools
  ** 23.0.1
  install!

  create a virtual device
  - look for the Marshmallow API Level 23, x86_64 ABI image with a
    Android 6.0 (Google APIs) target

  more details:
  https://facebook.github.io/react-native/docs/getting-started.html#2-install-the-android-sdk

__EOF
popd

ln -sfn $(pwd)/install/android/androidrc $HOME/.bashrc.d/
source $(pwd)/install/android/androidrc
