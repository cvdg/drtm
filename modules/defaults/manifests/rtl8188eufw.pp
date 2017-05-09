#
# modules/defaults/manifests/rtl8188eufw.pp
#
# Date:        2017-05-09
# Description: Load firmware for TP-Link TL-WN725N Wireless N Nano USB adapter
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

class defaults::rtl8188eufw {
   file { '/lib/firmware/rtlwifi':
       ensure  => 'directory',     
       owner   => 'root',
       group   => 'root',
       mode    => '0755',
   }

   file { '/lib/firmware/rtlwifi/rtl8188eufw.bin':       
       source  => 'puppet:///modules/defaults/lib/firmware/rtlwifi/rtl8188eufw.bin',
       owner   => 'root',
       group   => 'root',
       mode    => '0644',
       require => File['/lib/firmware/rtlwifi'],
   }
}
