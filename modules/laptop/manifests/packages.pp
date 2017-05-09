#
# modules/laptop/manifests/packages.pp
#
# Date:        2017-05-08
# Description: Default laptop packages
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

class laptop::packages {
    package { [ 'awscli',
                'cryptsetup',
              ]:
        ensure => installed,
    }
}
