#!/bin/bash
# for interactive use

set -e

name="${1:-homebox}"
namespace="toolbx"
#baseimage="registry.fedoraproject.org/fedora-toolbox:${fedora_version}"
baseimage="toolbx/base"

source ./lib/_build-image.sh "${name}" "${namespace}" "${baseimage}"

echo "Creating toolbox"
toolbox create --image "${fullname}:latest" "${name}"