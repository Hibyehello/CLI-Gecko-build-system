#!/bin/bash

if [ -z "$1" ]
then
	echo "No input source file!"
	exit
fi	

echo
if $DEVKITPPC/bin/powerpc-eabi-gcc -shared -nostdlib -Wl,--oformat binary -Wa,-mregnames $1 -o out.o; then
	hexdump -e '4/1 "%02x" " " 4/1 "%02x" "\n"' out.o 
fi
echo
