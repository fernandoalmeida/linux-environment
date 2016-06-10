#!/bin/bash -e

sdk=google-cloud-sdk-113.0.0-linux-x86_64.tar.gz

pushd $(mktemp -d)
    wget -q https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/$sdk
    sudo tar -C /opt -zxf $sdk
    sudo /opt/google-cloud-sdk/install.sh
popd

ln -sfn $(pwd)/install/googlecloud/bashrc $HOME/.bashrc.d/googlecloud

source $(pwd)/install/googlecloud/bashrc

gcloud init
