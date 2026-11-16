#!/bin/bash
# for interactive use

set -ex

#source ~/.bash_aliases

registry_namespace="registry.gitlab.com/colorchestra-ci/toolbox"

# Set desired name via CLI argument, but default to "homebox"
name="${1:-homebox}"
tag="${registry_namespace}/${1}"

cd $(dirname "${BASH_SOURCE[0]}")/"$name"

echo "Building image"
podman build -t "${tag}:building" -f Containerfile

echo "Cleaning existing image and container(s) if any exist"
toolbox rmi "${tag}:latest" --force &> /dev/null
# TODO: check if toolbox is running/used, if so don't delete and print a message
toolbox rm "${tag}" --force &> /dev/null
# oder brauchen wir des? unklar
toolbox rm "${name}" --force &> /dev/null

echo "Promoting newly built image to latest"
podman tag "${tag}:building" "${tag}:latest"
podman untag "${tag}:latest" "${tag}:building"

echo "Creating toolbox"
toolbox create -i "$tag" "$name"
#distrobox create -i "$name" "$name"

