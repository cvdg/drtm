#
# modules/desktop/manifests/init.pp
#
# Date:        2017-05-13
# Description: Desktop
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

class desktop {
    include defaults

    include desktop::chrome
    include desktop::packages
}
