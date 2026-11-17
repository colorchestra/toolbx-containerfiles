#!/bin/bash
# for interactive use

set -e

# go to repo root for script calls
cd "$(dirname "${BASH_SOURCE[0]}")"   
# 
# build base images first
./lib/_build-base-images.sh

# toolboxen
#./build-toolbx.sh homebox
./build-toolbx.sh yt-dlp
./build-toolbx.sh cloud-tools

# homebox uses the core image directly, so no build step for it, just create a toolbox
echo "Creating homebox"
podman rm "homebox" --force &> /dev/null
toolbox create --image "localhost/toolbx/base:latest" "homebox"

# krun-microvms
./build-krun.sh base
./build-krun.sh yt-dlp

# bootc-vms
./build-bootc.sh vscode