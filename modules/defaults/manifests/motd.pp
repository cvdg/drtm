#
# modules/defaults/manifests/motd.pp
#
# Date:        2017-05-08
# Description: Default Message Of The Day
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

class defaults::motd {
   file { '/etc/motd': 
        content => template('defaults/etc/motd.erb'),
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
   }
}
