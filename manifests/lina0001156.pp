#
# manifests/lina0017872.pp
#
# Hardware:    Desktop
# Memory:      x G
# CPU:         x86_64
# BogoMIPS:    xx
# Filesystem:  64 GB
#
# Date:        2017-06-03
# Description: Desktop ASRock
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

node 'lina0001156' {
    include desktop

    include user::root
    include user::cvdg
    include user::eim
}
