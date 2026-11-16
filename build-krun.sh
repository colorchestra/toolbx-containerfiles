#!/bin/bash
# for interactive use

set -e

name="${1:-homebox}"
namespace="krun"
baseimage="registry.fedoraproject.org/fedora-minimal:45"

source ./lib/_build-image.sh "${name}" "${namespace}" "${baseimage}"
