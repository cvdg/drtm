#
# modules/defaults/manifests/hosts.pp
#
# Date:        2017-05-07
# Description: Default hosts
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

class defaults::hosts {
    file { '/etc/hosts': 
        content => template('defaults/etc/hosts.erb'),
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
    }
}
