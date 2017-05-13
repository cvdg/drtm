#
# manifests/rpiaXXXXXXX.pp
#
# Hardware:    Raspberry Pi 1
# Memory:      0.5 GB
# CPU:         armv6l / 1
# BogoMIPS:    38.40  / 153.60
# Filesystem:  xx GB (microSD)
#
# Date:        2017-05-13
# Description: Generic host
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

node /rpia\d{7}/ {
    include raspi

    include user::root
    include user::cvdg
}
