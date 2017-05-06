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


if [ ${EUID} -ne 0 ] ; then
    echo "You're not root"
    exit 1
fi

if [ ! -f /etc/debian_version ] ; then
    echo "Distribution is not a Debian Derivative"
    exit 1
fi


#
# Update system
#
apt-get update
apt-get dist-upgrade


#
# Install package puppet
#
apt-get install puppet


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

