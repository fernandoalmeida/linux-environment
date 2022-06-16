#!/bin/bash -e

pushd $(mktemp -d)
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install
popd

cat <<EOF
==================================================
# $HOME/.aws/credentials
==================================================
[default]
aws_access_key_id=EXAMPLE_DEFAULT_ID
aws_secret_access_key=EXAMPLE_DEFAULT_KEY
region=us-west-2
output=json

[fernando]
aws_access_key_id=EXAMPLE_USER_ID
aws_secret_access_key=EXAMPLE_USER_KEY
==================================================
EOF
