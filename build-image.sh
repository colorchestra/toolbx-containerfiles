#!/bin/bash

set -e

source ~/.bash_aliases

# Set desired name via CLI argument, but default to "homebox"
name="${1:-homebox}"

cd $(dirname "${BASH_SOURCE[0]}")/"$name"

echo "Building image"
podman build -t "${name}:building" -f Containerfile

echo "Cleaning existing image and container(s) if any exist"
toolbox rmi "${name}:latest" --force &> /dev/null
# TODO: check if toolbox is running/used, if so don't delete and print a message
toolbox rm "$name" --force &> /dev/null

echo "Promoting newly built image to latest"
podman tag "${name}:building" "${name}:latest"
podman untag "${name}:latest" "${name}:building"

echo "Creating toolbox"
toolbox create -i "$name" "$name"

