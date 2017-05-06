#
# modules/rpia/manifests/config.pp
#
# Date:        2017-05-06
# Description: Setup Home WiFi network
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

class rpia::wlan {
    file { '/etc/wpa_supplicant/wpa_supplicant.conf':
        source  => [ "puppet:///modules/rpia/etc/wpa_supplicant/wpa_supplicant.conf.${fqdn}",
                     "puppet:///modules/rpia/etc/wpa_supplicant/wpa_supplicant.conf.${domain}",
                     'puppet:///modules/rpia/etc/wpa_supplicant/wpa_supplicant.conf',
                   ],
        owner   => 'root',
        group   => 'root',
        mode    => '0600',
    }
}
