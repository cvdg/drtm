#
# modules/defaults/manifests/init.pp
#
# Date:        2017-05-07
# Description: Defaults
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

class defaults {
    include defaults::drtm
    include defaults::hostname
    include defaults::hosts
    include defaults::keyboard
    include defaults::locale
    include defaults::motd
    include defaults::packages
    include defaults::pmph
    include defaults::prompt
    include defaults::puppet
    include defaults::rtl8188eufw
    include defaults::ssh
    include defaults::sudo
    include defaults::timezone
    include defaults::vim
}
