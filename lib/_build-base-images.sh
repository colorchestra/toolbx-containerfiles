#!/bin/bash
 
set -e
source ./FEDORA_VERSION
# build base images first
# dir name, namespace, base image
echo "Using fedora version ${fedora_version}"
echo "Building toolbx base image..."
./_build-image.sh "base" "toolbx" "registry.fedoraproject.org/fedora-toolbox:${fedora_version}"
echo "Building toolbx krun image..."
./_build-image.sh "base" "krun" "registry.fedoraproject.org/fedora-minimal:${fedora_version}"
echo "Building toolbx bootc image..."
./_build-image.sh "base" "bootc" "quay.io/fedora/fedora-bootc:${fedora_version}"