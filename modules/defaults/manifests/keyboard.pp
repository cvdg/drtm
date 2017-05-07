#
# modules/defaults/manifests/keyboard.pp
#
# Date:        2017-05-07
# Description: Default keyboard
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

class defaults::keyboard {
   file { '/etc/default/keyboard': 
       source  => 'puppet:///modules/defaults/etc/default/keyboard',
       owner   => 'root',
       group   => 'root',
       mode    => '0644',
   }
}
