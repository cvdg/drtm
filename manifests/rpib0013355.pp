#
# manifests/rpia0013355.pp
#
# Hardware:    Raspberry Pi 2
# Memory:      1 GB
# CPU:         armv6l / 1
# BogoMIPS:    38.40  / 0
# Filesystem:  xx GB (microSD)
#
# Date:        2017-06-06:
# Description: Sense Hat
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

node 'rpia0013355' {
    include raspi

    include user::root
    include user::cvdg
}
