#
# modules/rpia/manifests/config.pp
#
# Date:        2017-05-06
# Description: Delete user pi
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

class rpia::config {
    #
    # Raspberry Pi 2/3: armv7l
    #
    if $::architecture == "armv7l" {
        file { '/boot/config.txt':
            source  => [ "puppet:///modules/rpia/boot/config.txt.${fqdn}",
                         "puppet:///modules/rpia/boot/config.txt.${domain}",
                         'puppet:///modules/rpia/boot/config.txt',
                       ],
            owner   => 'root',
            group   => 'root',
            mode    => '0755',
        }
    }
}
