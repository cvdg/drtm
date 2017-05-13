#
# modules/desktop/manifests/chrome.pp
#
# Date:        2017-05-13
# Description: Install Google Chrome
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

class desktop::chrome {
    exec { 'chrome update':
        command     => '/usr/bin/apt-get -y update',
        refreshonly => true,
    }

    exec { 'download google.pub':
        command     => '/usr/bin/wget -O /etc/apt/trusted.gpg.d/google.pub https://dl.google.com/linux/linux_signing_key.pub',
        onlyif      => '/usr/bin/test ! -f /etc/apt/trusted.gpg.d/google.pub',
    }

    exec { 'import google.pub':
        command     => '/usr/bin/apt-key --keyring /etc/apt/trusted.gpg.d/google.gpg add /etc/apt/trusted.gpg.d/google.pub',
        onlyif      => '/usr/bin/test ! -f /etc/apt/trusted.gpg.d/google.gpg',
        require     => Exec['download google.pub'],
    }

    file { '/etc/apt/sources.list.d/google-chrome.list':
        source      => 'puppet:///modules/desktop/etc/apt/sources.list.d/google-chrome.list',
        owner       => 'root',
        group       => 'root',
        mode        => '0644',
        require     => Exec['import google.pub'],
        notify      => Exec['chrome update'],
    }

    package { 'google-chrome-stable':
        ensure      => installed,
        require     => File['/etc/apt/sources.list.d/google-chrome.list'],
    }
}
