#!/bin/bash -e

start-mongo() {
   : ${MONGO_DATA:=/data/mongo}

    docker run \
	   -p 27017:27017 \
	   -v ${MONGO_DATA}:/data/db \
	   -d \
	   mongo
}
