#!/bin/bash -e

# Install Python
sudo apt-get install -qqy python2.7

# Install Pip
curl -sSL https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py
sudo python /tmp/get-pip.py
