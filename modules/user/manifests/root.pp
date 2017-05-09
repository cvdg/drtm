#
# modules/user/manifests/root.pp
#
# Date:        2017-05-07
# Description: User root
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

class user::root {
    user { 'root':
        ensure     => 'present',
        comment    => 'Root',
        home       => '/root',
        managehome => true,
        shell      => '/bin/bash',
        uid        => '0',
        gid        => '0',
        purge_ssh_keys => true,
    }

    ssh_authorized_key { 'ssh_root':
        user       => 'root',
        type       => 'rsa',
        key        => 'AAAAB3NzaC1yc2EAAAABIwAAAQEAt3rXMruJqh29KZj3dTVDshhsP3L7epAd8YSDowbAfldnDM2GQ02WV19KwS0TcSsQcRw47EOwuvD3Jz7BtydellrB5YHqbW9jtYNo6HCn06qomeM/eLn+n9h9JF1UQ6Y5dJ3m7ChksxkksLvMpNMQRS6So2hjIAbv7zF67BB2x4OkVS856bsT1pjMzOYAFvVPV9KTjxhtd76kqu5Wlp+WnPcEaQ0JIOvEOfsVl1KN5Q1JoB+R4ZPkmJVWh1OKFFUIzBiAVSCW1AfypTNv+vuEAvpxSaV8mgnqSSV+JPRdesBpHiksbvXVWZehZJuLqCXSRRtCotOEeNbRqtYynwcwpw==',
    }

    file { '/root/.bash_logout': 
        source  => 'puppet:///modules/user/root/.bash_logout',
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
    }

    file { '/root/.bash_profile': 
	source  => 'puppet:///modules/user/root/.bash_profile',
	owner   => 'root',
	group   => 'root',
	mode    => '0644',
    }

    file { '/root/.bashrc': 
	source  => 'puppet:///modules/user/root/.bashrc',
	owner   => 'root',
	group   => 'root',
	mode    => '0644',
    }

    file { '/root/.profile': 
        ensure  => 'absent',
    }
}
