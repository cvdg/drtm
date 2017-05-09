#
# modules/laptop/manifests/init.pp
#
# Date:        2017-05-08
# Description: Defaults
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

class laptop {
    include defaults
    include laptop::ssh
    include laptop::packages
}
