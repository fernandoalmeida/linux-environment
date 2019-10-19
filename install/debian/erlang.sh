#!/bin/bash -e

sudo rm -fr /etc/apt/sources.list.d/erlang-solutions.list

pushd $(mktemp -d)
  wget -qq http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
  sudo dpkg -i erlang-solutions_1.0_all.deb
popd

sudo apt-get update -qq
sudo apt-get install -qqy esl-erlang
