obj-m := aufs.o
aufs-y := super.o

ccflags-y += -DDEBUG
# CFLAGS_super.o := -DDEBUG


all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

test:
	sudo dmesg -C
	-cat /proc/modules | grep aufs
	sudo insmod aufs.ko
	-cat /proc/modules | grep aufs
	sudo rmmod aufs.ko
	dmesg