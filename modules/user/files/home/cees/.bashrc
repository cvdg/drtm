#
# This file is maintained by Puppet.
# Manual changes will be overwritten.
#

if [ -d ${HOME}/bin ] ; then
    PATH=${HOME}/bin:${PATH}
fi

if [ -f /etc/motd ] ; then
    cat /etc/motd
fi
