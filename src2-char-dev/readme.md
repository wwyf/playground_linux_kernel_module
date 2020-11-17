# src2

Only a char device

can test with

```bash
#!/bin/bash

set -xe

DEVICE_NUM=242

sudo mknod /dev/lkm_example c ${DEVICE_NUM} 0

# you can test with
# cat /dev/lkm_example
read -p "ok?"

sudo rm /dev/lkm_example
sudo rmmod lkm_example
```