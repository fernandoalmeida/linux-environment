#!/bin/bash
set -euo pipefail

sudo apt-get install -qqy lxc

# default configs for unprivileged containers
ln -sfn $(pwd)/install/lxc ~/.config/lxc

# subordinate uid/gid mappings (login:id:count)
uid_map="$USER:$(id -u):65536"
if [ -z $(grep $uid_map /etc/subuid) ]; then
    echo $uid_map | sudo tee -a /etc/subuid
fi

gid_map="$USER:$(id -g):65536"
if [ -z $(grep $gid_map /etc/subgid) ]; then
    echo $gid_map | sudo tee -a /etc/subgid
fi

# Set network devices quota for unprivileged users, by default isn't allowed
# to create any network device on the host.
if [ ! -f /etc/lxc/lxc-usernet ]; then
    echo "$USER veth lxcbr0 10" | sudo tee -a /etc/lxc/lxc-usernet
fi
