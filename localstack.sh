#!/usr/bin/env bash

set -e


echo "Starting localstack @ local environment"

docker run -d \
    --name localstack \
    -p 443:443 \
    -p 4567-4583:4567-4583 \
    -p 4590-4593:4590-4593 \
    -p 8080:8080 \
    localstack/localstack

pip install awscli-local

