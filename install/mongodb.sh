#!/bin/bash -e

sudo apt-get update -qq
sudo apt-get install -qq --yes --force-yes lsb-release adduser

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
echo "deb http://repo.mongodb.org/apt/debian $(lsb_release -sc)/mongodb-org/3.0 main" | sudo tee /etc/apt/sources.list.d/mongodb.list
sudo apt-get update -qq
sudo apt-get install -qq --yes --force-yes mongodb-org
