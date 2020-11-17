#!/bin/bash

set -xe

DEVICE_NUM=242

# https://www.ibm.com/support/knowledgecenter/en/ssw_aix_72/m_commands/mknod.html
sudo mknod /dev/lkm_example c ${DEVICE_NUM} 0

# you can test with
# cat /dev/lkm_example
read -p "ok?"

sudo rm /dev/lkm_example
sudo rmmod lkm_example