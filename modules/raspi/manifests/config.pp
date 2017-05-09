#
# modules/raspi/manifests/config.pp
#
# Date:        2017-05-09
# Description: Set /boot/config.txt
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

class raspi::config {
    #
    # Raspberry Pi 1: armv6l
    #
    if $::architecture == "armv6l" {
        file { '/boot/config.txt':
            source  => [ "puppet:///modules/raspi/boot/config.txt.${fqdn}",
                         "puppet:///modules/raspi/boot/config.txt.${domain}",
                         'puppet:///modules/raspi/boot/config.txt',
                       ],
            owner   => 'root',
            group   => 'root',
            mode    => '0755',
        }
    }

    #
    # Raspberry Pi 2/3: armv7l
    #
    if $::architecture == "armv7l" {
        file { '/boot/config.txt':
            source  => [ "puppet:///modules/raspi/boot/config.txt.${fqdn}",
                         "puppet:///modules/raspi/boot/config.txt.${domain}",
                         'puppet:///modules/raspi/boot/config.txt',
                       ],
            owner   => 'root',
            group   => 'root',
            mode    => '0755',
        }
    }
}
