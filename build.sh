#!/bin/bash

BOLD='\033[1m'
RED='\033[0;31m'
GRAY='\033[0;30m'
NC='\033[0m'

if [ -z "$1" ]
then
echo
	echo -e "${RED}ERROR:${NC}${BOLD} No input file provided"
	echo
	echo -e "${GRAY}Usage:${NC}${BOLD} ./build.sh <input-file>.S <region>"
	echo
	exit
fi

if [ "$1" = "help" ]
then
	echo
	echo -e "${GRAY}Usage:${NC}${BOLD} ./build.sh <input-file>.S <region>"
	echo
	exit
fi

echo
if $DEVKITPPC/bin/powerpc-eabi-gcc -shared -nostdlib -Wl,--oformat binary -Wa,-mregnames -Dregion=\"$2\" $1 -o out.o; then
	hexdump -e '4/1 "%02x" " " 4/1 "%02x" "\n"' out.o 
fi
echo
