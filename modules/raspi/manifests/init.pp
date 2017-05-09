#
# modules/raspi/manifests/init.pp
#
# Date:        2017-05-09
# Description: Defaults Raspberry Pi
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

class raspi {
    include defaults

    include raspi::avahi
    include raspi::config
    include raspi::user_pi
}
