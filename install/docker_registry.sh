#!/bin/bash

: ${DOCKER_USER:="docker"}

# Make bucket (mb)
aws s3 mb s3://$DOCKER_USER

# Grant read/write privileges to the bucket
aws iam create-policy \
    --policy-name docker_registry \
    --policy-document file://install/docker_registry/aws-s3-policy.json

# Create user and generate access key (limit: 2 per user)
aws iam create-user \
    --user-name $DOCKER_USER && \
aws iam create-access-key \
    --user-name $DOCKER_USER

# Attach policy to the new user
account_id=$(aws iam get-account-authorization-details \
		    | grep -e ".*:policy/docker_registry" \
		    | tail -1 \
		    | sed 's/[^0-9]//g')
aws iam attach-user-policy \
    --policy-arn arn:aws:iam::$account_id:policy/docker_registry \
    --user-name $DOCKER_USER
