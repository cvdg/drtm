#
# modules/ssh/manifests/user_root.pp
#
# Date:        2017-05-06
# Description: Defaults SSH
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

class ssh::user_root {
  file { '/root/.ssh':
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    mode    => '0700',
  }

  file { '/root/.ssh/authorized_keys':
    source  => 'puppet:///modules/ssh/root/.ssh/authorized_keys',
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    require => File['/root/.ssh'],
  }
}
