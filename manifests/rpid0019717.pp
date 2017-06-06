#
# manifests/rpid0019717.pp
#
# Hardware:    Raspberry Pi 3
# Memory:      1 GB
# CPU:         armv7l / 4
# BogoMIPS:    38.40  / 153.60
# Filesystem:  xx GB (microSD)
#
# Date:        2017-06-06
# Description: ??
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

node 'rpid0019717' {
    include raspi

    include user::root
    include user::cvdg
}
