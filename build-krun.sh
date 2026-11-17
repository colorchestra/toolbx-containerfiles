#!/bin/bash
# for interactive use

set -e
cd "$(dirname "${BASH_SOURCE[0]}")"  # go to repo root for script calls
source ./lib/FEDORA_VERSION

name="${1:-homebox}"
namespace="krun"
baseimage="registry.fedoraproject.org/fedora-minimal:${fedora_version}"

./lib/_build-image.sh "${name}" "${namespace}" "${baseimage}"
