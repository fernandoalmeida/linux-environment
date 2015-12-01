#!/bin/bash -e

version=8
path=/usr/lib/jvm/java-$version-openjdk-amd64

sudo apt-get install -qqy openjdk-$version-jdk
sudo ln -sfn $path /usr/lib/jvm/default-java
sudo update-alternatives --set java $path/jre/bin/java
ln -sfn $(pwd)/install/java/javarc $HOME/.bashrc.d/
