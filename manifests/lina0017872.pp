#
# manifests/lina0017872.pp
#
# Hardware:    Desktop
# Memory:      8 G
# CPU:         x86_64
# BogoMIPS:    28732.79
# Filesystem:  1024 GB
#
# Date:        2017-05-08
# Description: Desktop Alternate
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

node 'lina0017872' {
    include desktop

    include user::root
    include user::cvdg
}
