# create your proc file

follow this [link](https://devarea.com/linux-kernel-development-creating-a-proc-file-and-interfacing-with-user-space/#.X7SleRMzYn8)


```bash
root@vm:/home/ubuntu/0code/playground_linux_kernel_module/src4-proc-skeleton# make
make -C /lib/modules/5.4.0-53-generic/build M=/home/ubuntu/0code/playground_linux_kernel_module/src4-proc-skeleton modules
make[1]: Entering directory '/usr/src/linux-headers-5.4.0-53-generic'
  Building modules, stage 2.
  MODPOST 1 modules
make[1]: Leaving directory '/usr/src/linux-headers-5.4.0-53-generic'
root@vm:/home/ubuntu/0code/playground_linux_kernel_module/src4-proc-skeleton# make test
sudo rmmod myproc.ko
rmmod: ERROR: Module myproc is not currently loaded
make: [Makefile:14: test] Error 1 (ignored)
sudo dmesg -C
cat /proc/modules | grep myproc
make: [Makefile:16: test] Error 1 (ignored)
sudo insmod myproc.ko
cat /proc/modules | grep myproc
myproc 16384 0 - Live 0xffffffffc063a000 (OE)
sudo echo "test" > /proc/mydev
echo: write error: Operation not permitted
make: [Makefile:19: test] Error 1 (ignored)
sudo cat /proc/mydev
sudo rmmod myproc.ko
dmesg
[ 5300.830224] write handler
[ 5300.842397] read handler
```

```
root@vm:/home/ubuntu/0code/playground_linux_kernel_module/src4-proc-skeleton# make
make -C /lib/modules/5.4.0-53-generic/build M=/home/ubuntu/0code/playground_linux_kernel_module/src4-proc-skeleton modules
make[1]: Entering directory '/usr/src/linux-headers-5.4.0-53-generic'
  Building modules, stage 2.
  MODPOST 1 modules
make[1]: Leaving directory '/usr/src/linux-headers-5.4.0-53-generic'
root@vm:/home/ubuntu/0code/playground_linux_kernel_module/src4-proc-skeleton# make test
sudo rmmod myproc.ko
rmmod: ERROR: Module myproc is not currently loaded
make: [Makefile:14: test] Error 1 (ignored)
sudo dmesg -C
cat /proc/modules | grep myproc
make: [Makefile:16: test] Error 1 (ignored)
sudo insmod myproc.ko irq=32 mode=4
cat /proc/modules | grep myproc
myproc 16384 0 - Live 0xffffffffc063a000 (OE)
sudo echo "66 6" > /proc/mydev
sudo cat /proc/mydev
irq = 66
mode = 6
sudo rmmod myproc.ko
dmesg
[ 8856.178781] read handler
[ 8856.179011] read handler
root@vm:/home/ubuntu/0code/playground_linux_kernel_module/src4-proc-skeleton# 
```