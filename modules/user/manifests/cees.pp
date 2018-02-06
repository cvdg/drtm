#
# modules/user/manifests/cees.pp
#
# Date:        2018-02-05
# Description: User cvdg
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2018 C.A. van de Griend
#

class user::cees {
    #
    # Raspbian uses gid 2000 for group 'user'.
    #
    group { 'cees':
        ensure     => 'present',
        gid        => '2003',
        system     => 'no',
    }

    user { 'cees':
        ensure         => 'present',
        comment        => 'Cees van de Griend',
        home           => '/home/cees',
        managehome     => 'true',
        shell          => '/bin/bash',
        uid            => '2003',
        gid            => '2003',
        groups         => [ 'adm', 'sudo', ],
        purge_ssh_keys => 'true',
        require        => Group['cees'],
    }

    ssh_authorized_key { 'ssh_cees':
        user           => 'cees',
        type           => 'rsa',
        key            => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDAuSM5vNG4UoHvXODJVR/PMxv6YZggGBzbAZI2og3YFQskzgpZeTTxq1+zNgFeObv9a3OkQCfGY3wxC3oZ6apzTrDxUbtM5uari2zaLxYsTBYqusELpYoC1pg3zBujXT9WaKs9hrqcRWhAIVMB+JJAmKBPFUtNNNXWI8V+bteK8d46U2kFUOQM0PNixVGKAmQIOLOPRKGATMepamFybhEPmO5dyajEzjcDvwPWerOYlgTTuGBdXfpQjcdSm+8XCWSadzP76FhKIiuaRgf0UIPC3AncdvgsLuAy9gsVtDLqT/HMFH6M69CZm+RmKVSQKIX2Al9vqhhusDKTLWEvje4t',
        require        => User['cees'],
    }

    file { '/etc/sudoers.d/cees': 
        source         => 'puppet:///modules/user/etc/sudoers.d/cees',
        owner          => 'root',
        group          => 'root',
        mode           => '0644',
        require        => Group['cees'],
    }

    file { '/home/cees/.bash_logout': 
        source         => 'puppet:///modules/user/home/cees/.bash_logout',
        owner          => 'cees',
        group          => 'cees',
        mode           => '0644',
        require        => User['cees'],
    }

    file { '/home/cees/.bash_profile': 
	source         => 'puppet:///modules/user/home/cees/.bash_profile',
	owner          => 'cees',
	group          => 'cees',
	mode           => '0644',
        require        => User['cees'],
    }

    file { '/home/cees/.bashrc': 
	source         => 'puppet:///modules/user/home/cees/.bashrc',
	owner          => 'cees',
	group          => 'cees',
	mode           => '0644',
        require        => User['cees'],
    }

    file { '/home/cees/.profile': 
        ensure         => 'absent',
        require        => User['cees'],
    }

    file { '/home/cees/bin': 
	ensure         => 'directory',
	source         => 'puppet:///modules/user/home/cees/bin',
	recurse        => 'true',
	owner          => 'cees',
	group          => 'cees',
	mode           => '0700',
        require        => User['cees'],
    }
}
