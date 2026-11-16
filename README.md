- 

wir haben containerfiles und können die dreifach verwenden:
- für toolbx / wahrscheinlich auch distrobox, wenn wir einfach nur die tools da drin haben wollen
- für krun microvms
- für immutable kvm-vms mit bootc

dafür brauchen wir aber unterschiedliche base images
- toolbx: `registry.fedoraproject.org/fedora-toolbox:45`
- krun: `registry.fedoraproject.org/fedora-minimal:45`
- bootc: `quay.io/fedora/fedora-bootc:45`

die BASE-variable in den containerfiles bildet das ab und muss man entsprechend setzen beim bauen

noch zu klären: mapping, was wovon gebaut werden soll. nicht jedes containerfile ist für jeden ausführer geeignet

