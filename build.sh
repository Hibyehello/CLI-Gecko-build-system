#!/bin/bash

if [ -z "$1" ]
then
	echo
	echo "Usage: ./build.sh <input-file>.S <region>"
	echo
	exit
fi	

echo
if $DEVKITPPC/bin/powerpc-eabi-gcc -shared -nostdlib -Wl,--oformat binary -Wa,-mregnames -Dregion=\"$2\" $1 -o out.o; then
	hexdump -e '4/1 "%02x" " " 4/1 "%02x" "\n"' out.o 
fi
echo
