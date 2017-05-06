#
# manifests/default.pp
#
# Hardware:    Unknown
# Memory:      Unknown
# CPU:         Unknown
# BogoMIPS:    Unknown
# Filesystem:  Unknown
#
# Date:        2017-05-06
# Description: Default host
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

node default {
  notify { 'default':
  }

  include admin::default
}
