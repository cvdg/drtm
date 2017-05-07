#
# modules/ssh/manifests/init.pp
#
# Date:        2017-05-06
# Description: Defaults SSH
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#


class ssh {
    package { 'ssh':
        ensure => installed,
    }

    service { 'ssh':
        ensure  => running,
        enable  => true,
        require => Package['ssh'],
    }
}
