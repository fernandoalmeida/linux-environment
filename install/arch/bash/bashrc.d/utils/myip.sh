#!/bin/bash

myip() {
    ip -4 addr | grep inet | cut -c 10-
    echo "$(timeout 5 wget http://ipinfo.io/ip -qO -) public"
}
