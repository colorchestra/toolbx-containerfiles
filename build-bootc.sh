#!/bin/bash
# for interactive use

set -e

name="${1:-homebox}"
namespace="bootc"
baseimage="quay.io/fedora/fedora-bootc:${fedora_version}"

source ./lib/_build-image.sh "${name}" "${namespace}" "${baseimage}"
