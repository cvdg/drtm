#
# modules/defaults/manifests/prompt.pp
#
# Date:        2017-05-07
# Description: Default prompt
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

class defaults::prompt {
   file { '/etc/profile.d/prompt.sh': 
       source  => 'puppet:///modules/defaults/etc/profile.d/prompt.sh',
       owner   => 'root',
       group   => 'root',
       mode    => '0644',
   }
}
