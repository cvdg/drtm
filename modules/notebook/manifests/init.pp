#
# modules/notebook/manifests/init.pp
#
# Date:        2017-05-13
# Description: Notebook
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

class notebook {
    include desktop

    include notebook:firmware-linux-nonfree
}
