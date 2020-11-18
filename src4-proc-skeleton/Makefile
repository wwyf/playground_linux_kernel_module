obj-m := myproc.o
myproc-y := proc.o

ccflags-y += -DDEBUG
# CFLAGS_super.o := -DDEBUG


all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

test:
	-sudo rmmod myproc.ko
	sudo dmesg -C
	-cat /proc/modules | grep myproc
	sudo insmod myproc.ko irq=32 mode=4
	-cat /proc/modules | grep myproc
	-sudo echo "test" > /proc/mydev
	-sudo cat /proc/mydev
	sudo rmmod myproc.ko
	dmesg