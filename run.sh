#!/bin/bash

stty rows 25 columns 80

if [ -z "$1" ]
then
	echo "Doghead Realms"
	echo "Usage: $0 [dos path to doghead realms]"
	echo "example: $0 'D:\projects\doghe~22'"
	exit
else
	DOGHEAD_DIR=$1	
fi

dosemu -E "D: || CD $DOGHEAD_DIR || QBASIC.EXE /RUN doghead.bas"
