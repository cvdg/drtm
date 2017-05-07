#
# modules/defaults/manifests/hostname.pp
#
# Date:        2017-05-07
# Description: Default hostname
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

class defaults::hostname {
    file { '/etc/hostname': 
        content => template('defaults/etc/hostname.erb'),
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
    }
}
