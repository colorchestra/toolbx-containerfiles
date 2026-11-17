- 

wir haben containerfiles und können die dreifach verwenden:
- für toolbx / wahrscheinlich auch distrobox, wenn wir einfach nur die tools da drin haben wollen
- für krun microvms
- für immutable kvm-vms mit bootc

dafür brauchen wir aber unterschiedliche base images
- toolbx: `registry.fedoraproject.org/fedora-toolbox:${fedora_version}`
- krun: `registry.fedoraproject.org/fedora-minimal:${fedora_version}`
- bootc: `quay.io/fedora/fedora-bootc:${fedora_version}`

die BASE-variable in den containerfiles bildet das ab und muss man entsprechend setzen beim bauen

nach nem neuen fedora-release die version in FEDORA_VERSION anpassen, das wird dann von überall gesourct

## run
### toolbox
`toolbox enter homebox`
`to enter homebox`

home ist komplett gemountet, soweit sollte alles übliche funktionieren

### krun
`podman run --rm -ti --runtime krun -v ~/Music:/work:Z localhost/krun/base /bin/bash`

oder über [disco](https://github.com/colorchestra/disco), da gehts des automatisch

### bootc
`bcvk ephemeral run-ssh bootc/homebox` für oneshot ähnlich wie mit --rm

`bcvk libvirt run --name work --memory 4096 --cpus 2 --filesystem btrfs --bind ~/src/toolbx-containerfiles:/var/work --bind ~/Music:/var/music localhost/bootc/vscode` zum anlegen für toolbox style workflows

`bcvk libvirt ssh work` zum betreten

`bcvk libvirt stop work && bcvk libvirt start work`

`bcvk libvirt list` alle listen
