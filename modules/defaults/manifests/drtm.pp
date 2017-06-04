#
# modules/defaults/manifests/drtm.pp
#
# Date:        2017-06-04
# Description: Dartmoor
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

class defaults::drtm {
    file { '/etc/cron.daily/drtm': 
        ensure  => 'absent',
    }

    file { '/etc/cron.weekly/drtm': 
        ensure  => 'absent',
    }

    file { '/etc/systemd/system/drtm.service':
        ensure  => 'absent',
    }

    file { '/etc/systemd/system/drtm-daily.service':
        ensure  => 'absent',
    }

    file { '/etc/systemd/system/drtm-daily.timer':
        ensure  => 'absent',
    }
}
