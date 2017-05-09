#
# modules/raspi/manifests/avahi.pp
#
# Date:        2017-05-09
# Description: Disable avahi-daemon
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

class raspi::avahi {
   package { 'avahi-daemon':
        ensure => installed,
    }

    service { 'avahi-daemon':
        ensure  => stopped,
        enable  => false,
        require => Package['avahi-daemon'],
    }
}
