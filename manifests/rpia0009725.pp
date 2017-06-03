#
# manifests/rpia0008101.pp
#
# Hardware:    Raspberry Pi 1
# Memory:      512 KB
# CPU:         armv6l / 1
# BogoMIPS:    38.40  / 0
# Filesystem:  xx GB (microSD)
#
# Date:        2017-06-03
# Description: MQTT server
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

node 'rpia0008101' {
    include raspi

    include user::root
    include user::cvdg
}
