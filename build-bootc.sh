#!/bin/bash
# for interactive use

set -e
cd "$(dirname "${BASH_SOURCE[0]}")"  # go to repo root for script calls
source ./lib/FEDORA_VERSION

name="${1:-homebox}"
namespace="bootc"
#baseimage="quay.io/fedora/fedora-bootc:${fedora_version}"
baseimage="localhost/bootc/base:latest"

./lib/_build-image.sh "${name}" "${namespace}" "${baseimage}"
