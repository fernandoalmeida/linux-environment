#!/bin/bash -e

storage=https://storage.googleapis.com/minikube/releases
version=latest

pushd $(mktemp -d)
  curl -sLo minikube $storage/$version/minikube-linux-amd64 \
    && chmod +x minikube \
    && sudo mv minikube /usr/local/bin/
popd

minikube start --vm-driver=virtualbox
