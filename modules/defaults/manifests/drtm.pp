#
# modules/defaults/manifests/drtm.pp
#
# Date:        2017-05-24
# Description: Dartmoor
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

class defaults::drtm {
    file { '/etc/cron.daily/drtm': 
        source  => 'puppet:///modules/defaults/etc/cron.daily/drtm',
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
    }
}
