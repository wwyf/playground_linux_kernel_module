obj-m := myproc.o
myproc-y := proc.o

ccflags-y += -DDEBUG
# CFLAGS_super.o := -DDEBUG


all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

user_test:
	gcc -o usertest usertest.c
	-sudo rmmod myproc.ko
	sudo dmesg -C
	-cat /proc/modules | grep myproc
	sudo insmod myproc.ko irq=32 mode=4
	-cat /proc/modules | grep myproc
	-sudo echo "66 6" > /proc/mydev
	-sudo cat /proc/mydev
	./usertest
	sudo rmmod myproc.ko
	dmesg
	-rm -f usertest

test:
	-sudo rmmod myproc.ko
	sudo dmesg -C
	-cat /proc/modules | grep myproc
	sudo insmod myproc.ko irq=32 mode=4
	-cat /proc/modules | grep myproc
	-sudo echo "66 6" > /proc/mydev
	-sudo cat /proc/mydev
	sudo rmmod myproc.ko
	dmesg