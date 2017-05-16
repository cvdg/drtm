#
# modules/user/manifests/cvdg.pp
#
# Date:        2017-05-07
# Description: User cvdg
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

class user::cvdg {
    #
    # Raspbian uses gid 2000 for group 'user'.
    #
    group { 'cvdg':
        ensure     => 'present',
        gid        => '2001',
        system     => 'no',
    }

    user { 'cvdg':
        ensure         => 'present',
        comment        => 'Cees van de Griend',
        home           => '/home/cvdg',
        managehome     => 'true',
        shell          => '/bin/bash',
        uid            => '2001',
        gid            => '2001',
        groups         => [ 'adm', 'sudo', ],
        purge_ssh_keys => 'true',
        require        => Group['cvdg'],
    }

    ssh_authorized_key { 'ssh_cvdg':
        user           => 'cvdg',
        type           => 'rsa',
        key            => 'AAAAB3NzaC1yc2EAAAABIwAAAQEAt3rXMruJqh29KZj3dTVDshhsP3L7epAd8YSDowbAfldnDM2GQ02WV19KwS0TcSsQcRw47EOwuvD3Jz7BtydellrB5YHqbW9jtYNo6HCn06qomeM/eLn+n9h9JF1UQ6Y5dJ3m7ChksxkksLvMpNMQRS6So2hjIAbv7zF67BB2x4OkVS856bsT1pjMzOYAFvVPV9KTjxhtd76kqu5Wlp+WnPcEaQ0JIOvEOfsVl1KN5Q1JoB+R4ZPkmJVWh1OKFFUIzBiAVSCW1AfypTNv+vuEAvpxSaV8mgnqSSV+JPRdesBpHiksbvXVWZehZJuLqCXSRRtCotOEeNbRqtYynwcwpw==',
        require        => User['cvdg'],
    }

    file { '/etc/sudoers.d/cvdg': 
        source         => 'puppet:///modules/user/etc/sudoers.d/cvdg',
        owner          => 'root',
        group          => 'root',
        mode           => '0644',
        require        => Group['cvdg'],
    }

    file { '/home/cvdg/.bash_logout': 
        source         => 'puppet:///modules/user/home/cvdg/.bash_logout',
        owner          => 'cvdg',
        group          => 'cvdg',
        mode           => '0644',
        require        => User['cvdg'],
    }

    file { '/home/cvdg/.bash_profile': 
	source         => 'puppet:///modules/user/home/cvdg/.bash_profile',
	owner          => 'cvdg',
	group          => 'cvdg',
	mode           => '0644',
        require        => User['cvdg'],
    }

    file { '/home/cvdg/.bashrc': 
	source         => 'puppet:///modules/user/home/cvdg/.bashrc',
	owner          => 'cvdg',
	group          => 'cvdg',
	mode           => '0644',
        require        => User['cvdg'],
    }

    file { '/home/cvdg/.profile': 
        ensure         => 'absent',
        require        => User['cvdg'],
    }

    file { '/home/cvdg/bin': 
	ensure         => 'directory',
	source         => 'puppet:///modules/user/home/cvdg/bin',
	recurse        => 'true',
	owner          => 'cvdg',
	group          => 'cvdg',
	mode           => '0700',
        require        => User['cvdg'],
    }

}
