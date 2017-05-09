#
# manifests/linb0005140.pp
#
# Hardware:    Laptop
# Memory:      3 G
# CPU:         amd64
# BogoMIPS:    8800
# Filesystem:  500 GB
#
# Date:        2017-05-08
# Description: Generic host
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

node 'linb0005140' {
    notify { 'linb0005140':
    }

    include laptop

    include user::root
    include user::cvdg
}
