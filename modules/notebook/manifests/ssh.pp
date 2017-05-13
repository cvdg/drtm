#
# modules/notebook/manifests/packages.pp
#
# Date:        2017-05-08
# Description: Default notebook packages
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

class notebook::ssh {
    package { 'ssh':
        ensure  => installed,
    }

    service { 'ssh':
        ensure  => stopped,
        enable  => false,
        require => Package['ssh'],
    }
}
