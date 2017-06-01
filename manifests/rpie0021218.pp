#
# manifests/rpid0021218.pp
#
# Hardware:    Raspberry Pi Zero W
# Memory:      512 KB
# CPU:         armv6l / 1
# BogoMIPS:    38.40  / 153.60
# Filesystem:  8 GB (microSD)
#
# Date:        2017-06-01
# Description: Wifi camera
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

node 'rpie0021218' {
    include raspi

    include user::root
    include user::cvdg
}
