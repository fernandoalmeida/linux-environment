#!/bin/bash -e

sudo pip install -q awscli

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
