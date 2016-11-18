#!/bin/bash

declare -a CI_PLATFORMS=(
    "centos_7"
    "fedora_23"
    "fedora_24"
    "ubuntu_trusty"
    "ubuntu_xenial"
)
DOCKER_UPSTREAM=andrewrothstein/docker-ansible-role
