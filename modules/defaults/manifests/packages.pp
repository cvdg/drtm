#
# modules/defaults/manifests/packages.pp
#
# Date:        2017-05-13
# Description: Default editor vim
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

class defaults::packages {
    package { [ 'apt-transport-https', # Needed voor Google Chrome repo
                'cryptsetup',          # Missing in Ubuntu 
              ]:
        ensure => installed,
    }
}
