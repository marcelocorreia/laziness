#!/usr/bin/env bash

set -e

cd $HOME
mkdir concourse-dev
cd concourse-dev
curl https://concourse-ci.org/docker-compose.yml -O
sed -e's/CONCOURSE_EXTERNAL_URL=.*/CONCOURSE_EXTERNAL_URL=http:\/\/localhost:8080/g' docker-compose.yml

docker-compose up -d


