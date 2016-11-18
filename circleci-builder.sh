#!/bin/bash
set -xe

TARGET_ROLE=$1
i=0
files=()
for os in centos_7 fedora_23 ubuntu_trusty ubuntu_xenial alpine_3.3 alpine_3.4 alpine_edge; do
    if [ $(($i % $CIRCLE_NODE_TOTAL)) -eq $CIRCLE_NODE_INDEX ]
    then
	UPSTREAM=andrewrothstein/docker-ansible-role
	docker pull $UPSTREAM:$os
	echo "FROM $UPSTREAM:$os" > Dockerfile.$os
	TARGET=$CIRCLE_PROJECT_REPONAME:$CIRCLE_TAG
	docker build -t $TARGET -f Dockerfile.$os .
    fi
    ((i=i+1))
done
