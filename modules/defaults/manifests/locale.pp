
#
# modules/defaults/manifests/locale.pp
#
# Date:        2017-05-07
# Description: Default locale
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

class defaults::locale {
  package { 'locales':
    ensure => installed,
  }

  file { '/etc/locale.gen':
    source  => 'puppet:///modules/defaults/etc/locale.gen',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['locales'],
  }

  file { '/etc/default/locale':
    source  => 'puppet:///modules/defaults/etc/default/locale',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => File['/etc/locale.gen'],
  }

  exec { '/usr/sbin/locale-gen':
    require     => File['/etc/locale.gen'],
    subscribe   => File["/etc/locale.gen"],
    refreshonly => true,
  }
}
