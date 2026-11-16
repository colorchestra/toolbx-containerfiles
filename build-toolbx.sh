#!/bin/bash
# for interactive use

set -e

name="${1:-homebox}"
namespace="toolbx"
baseimage="registry.fedoraproject.org/fedora-toolbox:45"

source ./lib/_build-image.sh "${name}" "${namespace}" "${baseimage}"

echo "Creating toolbox"
toolbox create --image "${fullname}:latest" "${name}"