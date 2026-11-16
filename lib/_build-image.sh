#!/bin/bash
# for non-interactive use
# use build-toolbox.sh, build-krun.sh, build-bootc.sh as frontends
# 
# usage: _build-image.sh NAME NAMESPACE BASEIMAGE

set -e

name="$1"
namespace="$2"
base_image="$3"
fullname="${namespace}/${name}"
temp_tag="build-$(date +%Y%m%d_%H%M%S)"

# ein dir hoch, aus lib raus, ins repo root. sorry, hässlich...
cd $(dirname "${BASH_SOURCE[0]}")/../"$name"

echo "Building image with temporary tag"
podman build --build-arg BASE=${base_image} -t "${fullname}:${temp_tag}" -f Containerfile

# wenn erfolgreich: weiter
echo "Cleaning existing image and container(s) if any exist"
# TODO: check if toolbox is running/used, if so don't delete and print a message
# manpage sagt: A Toolbx container is an OCI container. Therefore, toolbox rm can be used interchangeably with podman rm.
# d.h. wir nehmen podman rm weil warum nicht, können aber nur mit container id oder pretty name löschen -> letzterer ist der reine $name
podman rm "${name}" --force &> /dev/null

# podman prefixt mit localhost/, löschen geht aber trotzdem ohne es
podman rmi "${fullname}:latest" --force &> /dev/null

echo "Promoting newly built image to latest"
podman tag "${fullname}:${temp_tag}" "${fullname}:latest"
podman untag "${fullname}:latest" "${fullname}:${temp_tag}"
