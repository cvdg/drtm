#
# manifests/rpia.pp
#
# Hardware:    Raspberry Pi 1
# Memory:      0.5 GB
# CPU:         armv6l / 1
# BogoMIPS:    38.40  / 153.60
# Filesystem:  xx GB (microSD)
#
# Date:        2017-05-09
# Description: Generic host
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

node /rpia\d{7}/ {
    notify { 'rpia':
    }

    include raspi
    include ssh

    include user::root
    include user::cvdg
}
