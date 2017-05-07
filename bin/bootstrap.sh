#!/bin/bash
#
# Date:        2017-05-06
# Description: Bootstrap a new system with Puppet.
#
# Example:     bootstrap.sh
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

OPT_DOMAIN=""
OPT_HOSTNAME=""
OPT_SKIP=0

while getopts ":d::h:s" OPT ; do
    case ${OPT} in
        d)
           OPT_DOMAIN=${OPTARG}
           ;;
        h)
           OPT_HOSTNAME=${OPTARG}
           ;;
        s)
            OPT_SKIP=1
            ;;
        *)
            cat << EOF
Usage: $0 -h hostname -d domainname [-s]
    -d domainname - domainname
    -h hostname   - hostname
    -s            - skip update system
EOF
            exit 1
            ;;
    esac
done


if [ ${EUID} -ne 0 ] ; then
    echo "You're not root"
    exit 1
fi

if [ ! -f /etc/debian_version ] ; then
    echo "Distribution is not a Debian Derivative"
    exit 1
fi



if [ ${OPT_SKIP} -eq 0 ] ; then
    #
    # Update system
    #
    apt-get -y update
    apt-get -y dist-upgrade


    #
    # Install package puppet
    #
    apt-get -y install puppet
fi



#
# Set /etc/hostname
#
cat > /etc/hostname << EOF
${OPT_HOSTNAME}
EOF



#
# Set /etc/hosts
#
cat > /etc/hosts << EOF
127.0.0.1	localhost
::1		localhost ip6-localhost ip6-loopback
ff02::1		ip6-allnodes
ff02::2		ip6-allrouters

127.0.1.1	${OPT_HOSTNAME}.${OPT_DOMAIN} ${OPT_HOSTNAME} 
EOF

/bin/hostname -F /etc/hostname



#
# Execute puppet
#
BIN_DIR=$(dirname $0)
cd ${BIN_DIR}/..
BASE_DIR=$(pwd)
MANIFESTS_DIR="${BASE_DIR}/manifests"
MODULES_DIR="${BASE_DIR}/modules"

if [ ! -d ${MANIFESTS_DIR} ] ; then
    echo "${MANIFESTS_DIR} not found"
    exit 1
fi

if [ ! -d ${MODULES_DIR} ] ; then
    echo "${MODULES_DIR} not found"
    exit 1
fi

/usr/bin/puppet apply --modulepath=${MODULES_DIR} ${MANIFESTS_DIR} --verbose

