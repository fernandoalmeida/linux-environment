#!/bin/bash

# install dependencies
sudo apt-get install -qq --yes --force-yes gcc libc6-dev

# Download source
curl -sSL http://download.redis.io/releases/redis-stable.tar.gz \
    -o /tmp/redis.tar.gz
mkdir -p /tmp/redis
tar -xzf /tmp/redis.tar.gz -C /tmp/redis --strip-components=1

# Compile it
make -C /tmp/redis
sudo make -C /tmp/redis install
echo -n | sudo /tmp/redis/utils/install_server.sh
rm -rf /tmp/redis*

# Bind to localhost
sudo sed -ie 's/# bind 127.0.0.1/bind 127.0.0.1/g' /etc/redis/6379.conf
sudo /etc/init.d/redis_6379 restart
