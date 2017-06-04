#
# modules/defaults/manifests/pmph.pp
#
# Date:        2017-06-04
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

    file { '/opt/pmph/lib/pmph-client-0.0.jar':
        source  => 'puppet:///modules/defaults//opt/pmph/lib/pmph-client-0.0.1-SNAPSHOT.jar',
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
    }

    file { '/etc/systemd/system/pmph.service':
        source  => 'puppet:///modules/defaults/etc/systemd/system/pmph.service',
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
    }

    exec { 'systemctl enable pmph.service':
        path        => '/bin:/sbin:/usr/bin:/usr/sbin',
        command     => 'systemctl enable pmph.service',
        require     => File['/etc/systemd/system/pmph.service'],
        subscribe   => File['/etc/systemd/system/pmph.service'],
        refreshonly => true,
    }

    exec { 'systemctl start pmph.service':
        path        => '/bin:/sbin:/usr/bin:/usr/sbin',
        command     => 'systemctl start pmph.service',
        require     => File['/etc/systemd/system/pmph.service'],
        subscribe   => File['/etc/systemd/system/pmph.service'],
        refreshonly => true,
    }
}
