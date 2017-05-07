#
# modules/defaults/manifests/vim.pp
#
# Date:        2017-05-07
# Description: Default editor vim
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

class defaults::vim {
   package { 'vim-nox':
        ensure => installed,
    }

   file { '/etc/profile.d/vim.sh': 
       source  => 'puppet:///modules/defaults/etc/profile.d/vim.sh',
       owner   => 'root',
       group   => 'root',
       mode    => '0644',
   }
}
