#!/bin/bash -e

wget -qO - https://debian.neo4j.org/neotechnology.gpg.key \
    | sudo apt-key add - &> /dev/null
echo 'deb http://debian.neo4j.org/repo stable/' \
    | sudo tee /etc/apt/sources.list.d/neo4j.list &> /dev/null
sudo apt-get update -qq
sudo apt-get install -qqy neo4j
