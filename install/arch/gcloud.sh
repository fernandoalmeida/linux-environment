#!/bin/bash -e

sdk=google-cloud-sdk-347.0.0-linux-x86_64.tar.gz

pushd $(mktemp -d)
    wget -q https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/$sdk
    sudo tar -C /opt -zxf $sdk
    sudo /opt/google-cloud-sdk/install.sh
popd

ln -sfn $(pwd)/install/arch/gcloud/gcloudrc.sh $HOME/.bashrc.d/custom/
source $(pwd)/install/arch/gcloud/gcloudrc.sh

gcloud init
# gcloud projects create "some-id" --set-as-default
gcloud config set compute/region us-east1
gcloud config set compute/zone us-east1-a
gcloud components install kubectl
