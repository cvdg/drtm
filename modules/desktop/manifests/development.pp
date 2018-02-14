#
# modules/desktop/manifests/development.pp
#
# Date:        2018-02-14
# Description: Development desktop
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2018 C.A. van de Griend
#

class desktop::development {
    include defaults

    include desktop::awscli
    include desktop::chrome
    include desktop::packages

    package { [ 'eclipse',
                'maven',
              ]:
        ensure => installed,
    }
}
