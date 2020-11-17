obj-m += lkm_example.o
all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

test:
	sudo dmesg -C
	-cat /proc/modules | grep lkm
	sudo insmod lkm_example.ko
	-cat /proc/modules | grep lkm
	sudo rmmod lkm_example.ko
	dmesg