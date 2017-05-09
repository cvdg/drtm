#
# manifests/rpia.pp
#
# Hardware:    Raspberry Pi 3
# Memory:      1 GB
# CPU:         armv7l / 4
# BogoMIPS:    38.40  / 153.60
# Filesystem:  xx GB (microSD)
#
# Date:        2017-05-09
# Description: Generic host
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

node /rpic\d{7}/ {
    notify { 'rpic':
    }

    include raspi
    include ssh

    include user::root
    include user::cvdg
}
