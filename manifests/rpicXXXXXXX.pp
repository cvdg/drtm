#
# manifests/rpicXXXXXXX.pp
#
# Hardware:    Raspberry Pi Zero
# Memory:      ? GB
# CPU:         ?
# BogoMIPS:    ?
# Filesystem:  xx GB (microSD)
#
# Date:        2017-05-13
# Description: Generic host
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

node /rpic\d{7}/ {
    include raspi

    include user::root
    include user::cvdg
}