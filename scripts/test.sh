#!/bin/bash

grep "MODULE_LICENSE" -B 27 /usr/src/linux-headers-`uname -r`/include/linux/module.h