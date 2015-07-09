#!/bin/bash -e

sudo add-apt-repository --yes ppa:nviennot/tmate
sudo apt-get update -qq
sudo apt-get install --yes --force-yes python-software-properties tmate
