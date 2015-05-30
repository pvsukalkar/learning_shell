#!/bin/sh
START=33
END=127
echo "Decimal Hex 	Character"
echo "------- ------- ---------"
for ((i=START; i<=END; i++)) 
do
	echo $i | awk '{printf(" %3d 	%2x 	%c\n", $1, $1, $1)}'
done
exit 0
