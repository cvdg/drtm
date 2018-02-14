#
# modules/docker/manifests/init.pp
#
# Date:        2018-02-14
# Description: Install Docker CE
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2018 C.A. van de Griend
#

class docker {
    if $::lsbdistid == "Debian" {
        exec { 'download docker.pub':
            command     => '/usr/bin/wget -O /etc/apt/trusted.gpg.d/docker.pub https://download.docker.com/linux/debian/gpg',
            onlyif      => '/usr/bin/test ! -f /etc/apt/trusted.gpg.d/docker.pub',
        }

        exec { 'import docker.pub':
            command     => '/usr/bin/apt-key --keyring /etc/apt/trusted.gpg.d/docker.gpg add /etc/apt/trusted.gpg.d/docker.pub',
            onlyif      => '/usr/bin/test ! -f /etc/apt/trusted.gpg.d/docker.gpg',
            require     => Exec['download docker.pub'],
        }
    }


    file { '/etc/apt/sources.list.d/docker.list':
        content     => template('docker/etc/apt/sources.list.d/docker.list.erb'),
        owner       => 'root',
        group       => 'root',
        mode        => '0644',
    }

    package { 'docker-ce':
        ensure      => installed,
        require     => File['/etc/apt/sources.list.d/docker.list'],
    }
}
