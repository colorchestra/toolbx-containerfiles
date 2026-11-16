#!/bin/bash
# for interactive use

set -e

# toolboxen
./build-toolbx.sh homebox
./build-toolbx.sh yt-dlp
./build-toolbx.sh cloud-tools

# krun-microvms
./build-krun.sh homebox
./build-krun.sh yt-dlp

# bootc-vms
./build-bootc.sh vscode