#
# modules/defaults/manifests/timezone.pp
#
# Date:        2017-05-07
# Description: Default timezone
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

class defaults::timezone {
  package { 'tzdata':
    ensure => installed,
  }

  file { '/etc/timezone':
    source  => 'puppet:///modules/defaults/etc/timezone',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['tzdata'],
  }

  exec { 'dpkg-reconfigure':
    path        => '/bin:/sbin:/usr/bin:/usr/sbin',
    command     => 'dpkg-reconfigure -f noninteractive tzdata',
    require     => File['/etc/timezone'],
    subscribe   => File["/etc/timezone"],
    refreshonly => true,
  }
}
