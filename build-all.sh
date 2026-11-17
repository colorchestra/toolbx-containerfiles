#!/bin/bash
# for interactive use

set -e
#source ./lib/FEDORA_VERSION
# build base images first
# dir name, namespace, base image
#source ./lib/_build-image.sh "base" "toolbx" "registry.fedoraproject.org/fedora-toolbox:${fedora_version}"
#source ./lib/_build-image.sh "base" "krun" "registry.fedoraproject.org/fedora-minimal:${fedora_version}"
#source ./lib/_build-image.sh "base" "bootc" "quay.io/fedora/fedora-bootc:${fedora_version}"
source ./lib/_build-base-images.sh

# toolboxen
./build-toolbx.sh homebox
./build-toolbx.sh yt-dlp
./build-toolbx.sh cloud-tools

# krun-microvms
./build-krun.sh homebox
./build-krun.sh yt-dlp

# bootc-vms
./build-bootc.sh vscode