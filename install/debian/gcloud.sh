#!/bin/bash -e

sudo apt-get install apt-transport-https ca-certificates gnupg curl

curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg

echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

sudo apt-get update && sudo apt-get install google-cloud-cli

gcloud init

##################################################
# optional commands, depending on the case
##################################################
# gcloud projects create "some-id" --set-as-default
# gcloud config set project some-id
# gcloud services enable compute.googleapis.com
# gcloud config set compute/region us-east1
# gcloud config set compute/zone us-east1-b
# gcloud components install kubectl
##################################################
