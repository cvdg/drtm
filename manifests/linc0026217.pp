#
# manifests/linc0026217.pp
#
# Hardware:    VMware desktop
# Memory:      8 G
# CPU:         x86_64
# BogoMIPS:    23232.00
# Filesystem:  64 GB
#
# Date:        2018-02-14
# # Description: VMware desktop (devops01)
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2018 C.A. van de Griend
#

node 'linc0026217' {
    include desktop::development
    include docker

    include user::root
    include user::cees
}
