#!/bin/bash -e

start-postgres() {
    : ${POSTGRES_VERSION:=12.2}
    : ${POSTGRES_USER:=postgres}
    : ${POSTGRES_PASSWORD:=postgres}
    : ${POSTGRES_DATA:=/data/postgres/$POSTGRES_VERSION}

    docker run \
    	   -p 5432:5432 \
    	   -v ${POSTGRES_DATA}:/var/lib/postgresql/data \
    	   -e POSTGRES_USER=${POSTGRES_USER} \
    	   -e POSTGRES_PASSWORD=${POSTGRES_PASSWORD} \
    	   -d \
    	   postgres:${POSTGRES_VERSION}
}
