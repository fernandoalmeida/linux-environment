#!/bin/bash -e

start-influx() {
    : ${INFLUXDB_VERSION:=1.3}
    : ${INFLUXDB_DATA:=/data/influxdb/$INFLUXDB_VERSION}

    mkdir -p $INFLUXDB_DATA

    docker run \
	   -p 8086:8086 \
	   -v $INFLUXDB_DATA:/var/lib/influxdb \
	   -d \
	   influxdb:$INFLUXDB_VERSION-alpine
}
