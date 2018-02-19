#
# modules/defaults/manifests/pmph_purge.pp
#
# Date:        2018-02-19
# Description: Pamphlet
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017-2018 C.A. van de Griend
#

class defaults::pmph_purge {
    file { '/opt/pmph': 
        ensure  => 'directory',
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
    }

    file { '/opt/pmph/lib': 
        source  => 'puppet:///modules/defaults/opt/pmph/lib',
        ensure  => 'directory',
        recurse => 'true',
        purge   => 'true',
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
        require => File['/opt/pmph/lib'],
    }

    file { '/var/opt/pmph/log': 
        ensure  => 'directory',
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
        require => File['/var/opt/pmph'],
    }

    file { '/etc/systemd/system/pmph.service':
        source  => 'puppet:///modules/defaults/etc/systemd/system/pmph.service',
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
        require => File['/opt/pmph/lib'],
    }

    service { 'pmph':
        enable      => 'false', 
        ensure      => 'stopped',
        require     => File['/etc/systemd/system/pmph.service'],
    }
}
