#
# manifests/rpia.pp
#
# Hardware:    Raspberry Pi 2
# Memory:      1 GB
# CPU:         armv7l / 4
# BogoMIPS:    38.40  / 153.60
# Filesystem:  xx GB (microSD)
#
# Date:        2017-05-07
# Description: Generic host
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

node /rpib\d{7}/ {
    notify { 'rpia':
    }

    include raspi
    include ssh

    include user::root
    include user::cvdg
}
