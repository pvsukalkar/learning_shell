#!/bin/sh
RANGE=10
MAXVAL=9
i=$RANDOM
let "i %= $RANGE"
if [ "$i" -lt "$MAXVAL" ] ; then 
	echo "i= $i"
	./$0
fi
exit 0
