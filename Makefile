all:
	gcc -Wall caps2ctrl2esc.c -o caps2ctrl2esc -I/usr/include/libevdev-1.0 -levdev -ludev
