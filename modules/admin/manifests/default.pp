#
# modules/admin/manifests/default.pp
#
# Date:        2017-05-06
# Description: Defaults
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#


class admin::default {
    include admin::motd
}
