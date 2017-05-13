#
# modules/notebook/manifests/firmware-linux-nonfree.pp
#
# Date:        2017-05-13
# Description: Install firmware-linux-nonfree
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

class notebook::firmware-linux-nonfree {
    if $hostname ==  'linb0005140' {
        file { '/etc/apt/sources.list.d/nonfree.list':
            source      => 'puppet:///modules/notebook/etc/apt/sources.list.d/nonfree.list',
            owner       => 'root',
            group       => 'root',
            mode        => '0644',
        }
    
        exec { 'firmware-linux-nonfree update':
            command     => '/usr/bin/apt-get -y update',
            require     => File['/etc/apt/sources.list.d/nonfree.list'],
            subscribe   => File["/etc/apt/sources.list.d/nonfree.list"],
            refreshonly => true,
        }
    
        package { 'firmware-linux-nonfree':
            ensure      => installed,
            require     => Exec['firmware-linux-nonfree update'],
        }
    }
}
