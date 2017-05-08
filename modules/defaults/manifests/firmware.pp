#
# modules/defaults/manifests/firmware.pp
#
# Date:        2017-05-08
# Description: Default editor vim
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

class defaults::firmware {
    file { '/etc/apt/sources.list.d/nonfree.list':
        source      => 'puppet:///modules/defaults/etc/apt/sources.list.d/nonfree.list',
        owner       => 'root',
        group       => 'root',
        mode        => '0644',
    }

    exec { '/usr/bin/apt-get -y update':
        require     => File['/etc/apt/sources.list.d/nonfree.list'],
        subscribe   => File["/etc/apt/sources.list.d/nonfree.list"],
        refreshonly => true,
    }

    package { 'firmware-linux-nonfree':
        ensure      => installed,
        require     => Exec['/usr/bin/apt-get -y update'],
    }
}
