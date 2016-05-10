#!/bin/bash

set -euo pipefail

curl -sL https://packagecloud.io/gpg.key | sudo apt-key add -
echo "deb https://packagecloud.io/grafana/stable/debian/ jessie main" \
    | sudo tee /etc/apt/sources.list.d/grafana.list

sudo apt-get update -qq
sudo apt-get install -qqy grafana
