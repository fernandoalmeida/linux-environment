#!/bin/bash -e

start-redis() {
    : ${REDIS_DATA:=/data/redis}

    docker run \
	   -p 6379:6379 \
	   -v ${REDIS_DATA}:/data \
	   -d \
	   redis
}
