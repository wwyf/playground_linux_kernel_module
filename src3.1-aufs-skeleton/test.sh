#!/bin/bash

set -xe

make clean
make

sudo dmesg -C
#cat /proc/modules | grep aufs
sudo insmod aufs.ko
cat /proc/modules | grep aufs

# test fs
touch image
mkdir -p mount_dir
sudo mount -o loop -t aufs ./image ./mount_dir
sudo umount ./mount_dir

sudo rmmod aufs.ko
dmesg

rm image
rm -rf mount_dir