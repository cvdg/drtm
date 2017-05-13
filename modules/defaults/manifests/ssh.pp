#
# modules/defaults/manifests/ssh.pp
#
# Date:        2017-05-13
# Description: Ensure ssh is installed and running.
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

class defaults::ssh {
    package { 'ssh':
        ensure  => installed,
    }

    service { 'ssh':
        ensure  => running,
        enable  => true,
        require => Package['ssh'],
    }
}
