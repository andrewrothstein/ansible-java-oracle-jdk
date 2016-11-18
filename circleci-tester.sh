#!/bin/bash
set -xe

i=0
files=()
for os in centos_7 fedora_23 fedora_24 ubuntu_trusty ubuntu_xenial alpine_3.3 alpine_3.4 alpine_edge; do
    if [ $(($i % $CIRCLE_NODE_TOTAL)) -eq $CIRCLE_NODE_INDEX ]
    then
	TARGET=$CIRCLE_PROJECT_REPONAME:$CIRCLE_TAG
	docker images $TARGET
    fi
    ((i=i+1))
done
