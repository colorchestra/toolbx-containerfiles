#!/bin/bash
# for interactive use

set -e
cd "$(dirname "${BASH_SOURCE[0]}")"  # go to repo root for script calls

name="${1:-homebox}"
namespace="toolbx"
#baseimage="registry.fedoraproject.org/fedora-toolbox:${fedora_version}"
baseimage="toolbx/base"
fullname="${namespace}/${name}"

./lib/_build-image.sh "${name}" "${namespace}" "${baseimage}"

echo "Creating toolbox"
toolbox create --image "${fullname}:latest" "${name}"