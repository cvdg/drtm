#
# modules/defaults/manifests/pmph.pp
#
# Date:        2017-06-05
# Description: Pamphlet
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

class defaults::pmph {
    file { '/opt/pmph': 
        ensure  => 'directory',
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
    }

    file { '/opt/pmph/lib': 
        ensure  => 'directory',
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
        require => File['/opt/pmph'],
    }

    file { '/var/opt/pmph': 
        ensure  => 'directory',
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
    }

    file { '/var/opt/pmph/log': 
        ensure  => 'directory',
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
        require => File['/var/opt/pmph'],
    }

    file { '/opt/pmph/lib/pmph-client-1.0.jar':
        source  => 'puppet:///modules/defaults//opt/pmph/lib/pmph-client-1.0.jar',
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        require => File['/opt/pmph/lib'],
        require => File['/var/opt/pmph/log'],
    }

    file { '/etc/systemd/system/pmph.service':
        source  => 'puppet:///modules/defaults/etc/systemd/system/pmph.service',
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
        require => File['/opt/pmph/lib/pmph-client-1.0.jar'],
    }

    service { 'pmph':
        enable      => 'true',
        ensure      => 'running',
        require     => File['/etc/systemd/system/pmph.service'],
    }
}
