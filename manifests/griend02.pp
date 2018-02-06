#
# manifests/griend02.pp
#
# Hardware:    VMware desktop
# Memory:      4 G
# CPU:         x86_64
# BogoMIPS:    14000.00
# Filesystem:  32 GB
#
# Date:        2018-02-05
# Description: VMware desktop
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2018 C.A. van de Griend
#

node 'griend02' {
    include desktop

    include user::root
    include user::cees
}
