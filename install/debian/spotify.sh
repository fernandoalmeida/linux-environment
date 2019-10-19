#!/bin/bash -e

debian_ftp=http://ftp.acc.umu.se/mirror/cdimage/snapshot/Debian/pool/main
deb_file=libgcrypt11_1.5.3-5_amd64.deb

pushd $(mktemp -d)
    wget -q $debian_ftp/libg/libgcrypt11/$deb_file
    sudo dpkg -i $deb_file
popd

sudo apt-key adv \
     --keyserver hkp://keyserver.ubuntu.com:80 \
     --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 \
     &> /dev/null

echo deb http://repository.spotify.com stable non-free \
    | sudo tee /etc/apt/sources.list.d/spotify.list

sudo apt-get update -qq

sudo apt-get install -qqy spotify-client
