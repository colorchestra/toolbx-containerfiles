#!/bin/bash
# for interactive use

set -e

name="${1:-homebox}"
namespace="bootc"
baseimage="quay.io/fedora/fedora-bootc:45"

source ./lib/_build-image.sh "${name}" "${namespace}" "${baseimage}"
