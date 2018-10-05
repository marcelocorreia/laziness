#!/usr/bin/env bash

set -e

CONCOURSE_DEV_HOME=$HOME/concourse-dev

up(){
    docker-compose up -d
}

if [ -d "$CONCOURSE_DEV_HOME" ];then
    echo CONCOURSE_DEV_HOME @ $CONCOURSE_DEV_HOME already exists
    cd $CONCOURSE_DEV_HOME
    up
else
    mkdir $CONCOURSE_DEV_HOME
    cd $CONCOURSE_DEV_HOME
    curl https://concourse-ci.org/docker-compose.yml -O
    sed -i .bak -e 's/CONCOURSE_EXTERNAL_URL.*/CONCOURSE_EXTERNAL_URL=http:\/\/localhost:8080/g'  $CONCOURSE_DEV_HOME/docker-compose.yml
    up
fi


