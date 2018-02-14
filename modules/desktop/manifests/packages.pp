#
# modules/desktop/manifests/packages.pp
#
# Date:        2018-02-14
# Description: Default desktop packages
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017-2018 C.A. van de Griend
#

class desktop::packages {
    package { [ 'keepassx',
                'libxml2-utils',
                'mc',
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
