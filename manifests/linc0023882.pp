#
# manifests/lina0017872.pp
#
# Hardware:    VMware desktop
# Memory:      2 G
# CPU:         x86_64
# BogoMIPS:    14000.00
# Filesystem:  16 GB
#
# Date:        2017-10-05
# Description: VMware desktop
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

node 'linc0023882' {
    include desktop

    include user::root
    include user::cvdg
}
