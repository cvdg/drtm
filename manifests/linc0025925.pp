#
# manifests/linc0025925.pp
#
# Hardware:    VMware desktop
# Memory:      4 G
# CPU:         x86_64
# BogoMIPS:    23232.00
# Filesystem:  16 GB
#
# Date:        2018-02-12
# # Description: VMware desktop (tab03)
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2018 C.A. van de Griend
#

node 'linc0025925' {
    include desktop

    include user::root
    include user::cees
}
