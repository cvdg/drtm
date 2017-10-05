#
# modules/desktop/manifests/packages.pp
#
# Date:        2017-05-13
# Description: Default desktop packages
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

class desktop::packages {
    package { [ 'keepassx',
              ]:
        ensure => installed,
    }

    if $facts['virtual'] == 'vmware' {
        package { [ 'open-vm-tools-desktop',
                  ]:
            ensure => installed,
        }
    }
}
