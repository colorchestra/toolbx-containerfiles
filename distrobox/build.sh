#!/usr/bin/env bash
# Baut das Container-Image und legt den Distrobox-Container an.
set -euo pipefail
 
cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
 
name="${1:-youtube-dl}"
tag="localhost/toolbox/${name}:latest"
 
if [[ ! -f "${name}/Containerfile" ]]; then
    echo "Kein Containerfile in ./${name}" >&2
    exit 1
fi
 
echo ">>> Baue ${tag}"
podman build --pull=newer -t "$tag" -f "${name}/Containerfile" "$name"
 
echo ">>> Lege Container an"
distrobox assemble create --file distrobox.ini --name "$name"
 
echo ">>> Raeume alte Images auf"
podman image prune -f
 
echo ">>> Fertig: ${name}"
 

