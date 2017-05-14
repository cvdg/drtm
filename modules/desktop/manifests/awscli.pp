#
# modules/desktop/manifests/awscli.pp
#
# Date:        2017-05-14
# Description: Install AWS command line interfase
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

class desktop::awscli {
    package { 'python-pip':
        ensure      => installed,
    }

    exec { 'awscli install':
        command     => '/usr/bin/pip install awscli',
        require     => Package['python-pip'],
        onlyif      => '/usr/bin/test ! -x /usr/local/bin/aws',
    }
}
