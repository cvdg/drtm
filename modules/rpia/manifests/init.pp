#
# modules/rpia/manifests/init.pp
#
# Date:        2017-05-06
# Description: Defaults Raspberry Pi 3
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#


class rpia {
    include rpia::avahi
    include rpia::config
    include rpia::user_pi
    include rpia::wlan
}
