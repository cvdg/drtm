#
# modules/defaults/manifests/puppet.pp
#
# Date:        2017-05-06
# Description: Default Puppet
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

class defaults::puppet {
   package { 'puppet':
        ensure => installed,
    }

    service { 'puppet':
        ensure  => stopped,
        enable  => false,
        require => Package['puppet'],
    }
}
