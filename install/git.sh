#!/bin/sh -e

sudo add-apt-repository ppa:git-core/ppa -y
sudo apt-get update -qq
sudo apt-get install git git-man --yes --force-yes -qq
