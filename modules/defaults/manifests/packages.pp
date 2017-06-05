#
# modules/defaults/manifests/packages.pp
#
# Date:        2017-05-13
# Description: Default editor vim
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

class defaults::packages {
    package { [ 'apt-transport-https', # Needed voor Google Chrome repo
                'cryptsetup',          # Missing in Ubuntu 
                'gnupg2',              # Missing in Raspbian
                'mosquitto-clients',   # MQTT cli
              ]:
        ensure => installed,
    }

    #
    # On a Raspberry Pi, the performance of the Oracle JDK is 
    # significant faster.
    #
    if $::lsbdistid == "Raspbian"  { 
        package { 'oracle-8-jdk':      # Oracke JDK 8
            ensure => 'installed',
        }


        package { 'openjdk-8-jdk':     # OpenJDK 8
            ensure => 'absent',
        }
    } else {
        package { 'openjdk-8-jdk':     # OpenJDK 8
            ensure => 'installed',
        }

        package { 'oracle-8-jdk':      # Oracke JDK 8
            ensure => 'absent',
        }
    }
}
