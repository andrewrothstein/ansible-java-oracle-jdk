#!/bin/bash
set -xe

. ./circleci-env.sh

i=0
files=()
for os in ${CI_PLATFORMS[@]}; do
    if [ $(($i % $CIRCLE_NODE_TOTAL)) -eq $CIRCLE_NODE_INDEX ]
    then
	docker images $CIRCLE_PROJECT_REPONAME:$os
    fi
    ((i=i+1))
done
