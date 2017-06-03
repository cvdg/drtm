#
# modules/user/manifests/eim.pp
#
# Date:        2017-06-03
# Description: User eim
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

class user::eim {
    #
    # Raspbian uses gid 2000 for group 'user'.
    #
    group { 'eim':
        ensure     => 'present',
        gid        => '2002',
        system     => 'no',
    }

    user { 'eim':
        ensure         => 'present',
        comment        => 'Eim van de Griend',
        home           => '/home/eim',
        managehome     => 'true',
        shell          => '/bin/bash',
        uid            => '2002',
        gid            => '2002',
        groups         => [ ],
        purge_ssh_keys => 'true',
        require        => Group['eim'],
    }
}
