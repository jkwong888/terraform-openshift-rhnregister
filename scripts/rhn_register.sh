#!/bin/bash
# Script to register with redhat and enable the packages required to install openshift on bastion machine.


# Unregister with softlayer subscription
username=$1
password=$2
#orgid=$1
#key=$2
poolID=$3

subscription-manager unregister

test -e /etc/rhsm/rhsm.conf.rpmnew && mv /etc/rhsm/rhsm.conf.rpmnew /etc/rhsm/rhsm.conf

subscription-manager register --username=${username} --password=${password}
subscription-manager refresh
subscription-manager attach --pool=${poolID}
subscription-manager repos --disable="*"
subscription-manager repos \
    --enable="rhel-7-server-rpms"  \
    --enable="rhel-7-server-extras-rpms"  \
    --enable="rhel-7-server-ose-3.11-rpms" \
    --enable="rhel-7-server-ansible-2.6-rpms" \
    --enable="rhel-7-server-optional-rpms" \
    --enable="rhel-7-fast-datapath-rpms" \
    --enable="rh-gluster-3-client-for-rhel-7-server-rpms" \
