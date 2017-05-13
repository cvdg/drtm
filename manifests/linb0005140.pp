#
# manifests/linb0005140.pp
#
# Hardware:    Notebook
# Memory:      3 G
# CPU:         amd64
# BogoMIPS:    8800
# Filesystem:  500 GB
#
# Date:        2017-05-08
# Description: Notebook ASUS K51AC
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

node 'linb0005140' {
    include notebook

    include user::root
    include user::cvdg
}
