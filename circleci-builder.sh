#!/bin/bash
set -xe

. ./circleci-env.sh

i=0
files=()
for os in $CI_PLATFORMS; do
    if [ $(($i % $CIRCLE_NODE_TOTAL)) -eq $CIRCLE_NODE_INDEX ]
    then
	docker pull $DOCKER_UPSTREAM:$os
	echo "FROM $DOCKER_UPSTREAM:$os" > Dockerfile.$os
	docker build -t $CIRCLE_PROJECT_REPONAME:$os -f Dockerfile.$os .
    fi
    ((i=i+1))
done
