#!/bin/bash -e

start-dynamo() {
    : ${DYNAMODB_DATA:=/data/dynamodb}

    docker run \
	   -v ${DYNAMODB_DATA}:/data \
	   -p 8000:8000 \
	   -d \
	   dwmkerr/dynamodb -dbPath /data
}
