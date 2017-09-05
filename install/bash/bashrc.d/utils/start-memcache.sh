#!/bin/bash -e

start-memcache() {
    docker run \
	   -p 11211:11211 \
	   -d \
	   memcached
}
