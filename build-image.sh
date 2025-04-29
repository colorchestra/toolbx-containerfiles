#!/bin/bash

set -e

source ~/.bash_aliases

# TODO: change it so that the image is firsst built with a temporary tag, and if successful the old image is deleted and the new one is promoted
# Set desired name via CLI argument, but default to "homebox"
name="${1:-homebox}"

echo "Cleaning existing image and container(s) if any exist"
toolbox rmi "$name" --force &> /dev/null

cd $(dirname "${BASH_SOURCE[0]}")

# ?
cd "$name"

echo "Building image"
podman build -t "$name" -f Containerfile

echo "Creating toolbox"
toolbox create -i "$name" "$name"

