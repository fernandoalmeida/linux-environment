#!/bin/bash

set -euo pipefail

curl -sL https://repos.influxdata.com/influxdb.key | sudo apt-key add -
echo "deb https://repos.influxdata.com/debian jessie stable" \
    | sudo tee /etc/apt/sources.list.d/influxdb.list

sudo apt-get update -qq
sudo apt-get install -qqy kapacitor

sudo systemctl start kapacitor
