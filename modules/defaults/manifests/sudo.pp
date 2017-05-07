#
# modules/defaults/manifests/sudo.pp
#
# Date:        2017-05-07
# Description: Package sudo
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

class defaults::sudo {
   package { 'sudo':
        ensure => installed,
    }
}
