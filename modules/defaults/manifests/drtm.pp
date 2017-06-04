#
# modules/defaults/manifests/drtm.pp
#
# Date:        2017-06-04
# Description: Dartmoor
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

class defaults::drtm {
    file { '/etc/cron.daily/drtm': 
        ensure  => 'absent',
    }

    file { '/etc/cron.weekly/drtm': 
        ensure  => 'absent',
    }

    file { '/etc/systemd/system/drtm.service':
        source  => 'puppet:///modules/defaults/etc/systemd/system/drtm.service',
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
    }

    file { '/etc/systemd/system/drtm-daily.service':
        source  => 'puppet:///modules/defaults/etc/systemd/system/drtm-daily.service',
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
    }

    file { '/etc/systemd/system/drtm-daily.timer':
        source  => 'puppet:///modules/defaults/etc/systemd/system/drtm-daily.timer',
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
        require => File['/etc/systemd/system/drtm-daily.service'],
    }

    # Service does not work for timers
    service { 'drtm.service':
        enable  => 'true',
        ensure  => 'running',
        require => File['/etc/systemd/system/drtm.service'],
    }

    exec { 'systemctl enable drtm-daily.timer':
        path        => '/bin:/sbin:/usr/bin:/usr/sbin',
        command     => 'sytemctl enable drtm-daily.timer',
        require     => File['/etc/systemd/system/drtm-daily.timer'],
        subscribe   => File['/etc/systemd/system/drtm-daily.timer'],
        refreshonly => true,
    }

    exec { 'systemctl start drtm-daily.timer':
        path        => '/bin:/sbin:/usr/bin:/usr/sbin',
        command     => 'sytemctl start drtm-daily.timer',
        require     => File['/etc/systemd/system/drtm-daily.timer'],
        subscribe   => File['/etc/systemd/system/drtm-daily.timer'],
        refreshonly => true,
    }
}
