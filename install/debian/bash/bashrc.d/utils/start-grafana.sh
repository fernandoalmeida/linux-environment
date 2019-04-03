#!/bin/bash -e

start-grafana() {
    : ${GRAFANA_PASSWORD:=secret}
    : ${GRAFANA_PORT:=5000}
    : ${GRAFANA_URL:=grafana.local}
    : ${GRAFANA_DATA:=/data/grafana}

    docker run \
	   -p ${GRAFANA_PORT}:3000 \
    	   -v ${GRAFANA_DATA}/data:/var/lib/grafana \
    	   -v ${GRAFANA_DATA}/log:/var/log/grafana \
	   -e "GF_SERVER_ROOT_URL=http://${GRAFANA_URL}" \
	   -e "GF_SECURITY_ADMIN_PASSWORD=${GRAFANA_PASSWORD}" \
	   -d \
	   grafana/grafana

    echo "http://${GRAFANA_URL}:${GRAFANA_PORT}"
    echo "admin:${GRAFANA_PASSWORD}"
}
