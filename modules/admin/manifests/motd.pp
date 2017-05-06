#
# modules/admin/manifests/motd.pp
#
# Date:        2017-05-06
# Description: Default Message Of The Day
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

class admin::motd {
   file { '/etc/motd': 
       source  => 'puppet:///modules/admin/etc/motd',
       owner   => 'root',
       group   => 'root',
       mode    => '0644',
   }
}
