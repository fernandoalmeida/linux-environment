#!/bin/bash -e

sudo dpkg --add-architecture i386

wget -qO - https://dl.winehq.org/wine-builds/Release.key \
    | sudo apt-key add - &> /dev/null

echo 'deb https://dl.winehq.org/wine-builds/debian/ jessie main' \
    | sudo tee /etc/apt/sources.list.d/wine.list &> /dev/null

sudo apt-get update -qq

sudo apt-get install -qqy --install-recommends winehq-staging
