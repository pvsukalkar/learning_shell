#!/bin/sh
ARGS=3			#script expects 3 arguments 
E_BADARGS=85
if [ $# -ne "$ARGS" ]
then
	echo "Usage:  `basename $0` old-pattern new-pattern filename "
	exit $E_BADARGS
fi

old_pattern=$1
new_pattern=$2

if [ -f "$3" ] ; then
	filename=$3
else
	echo "File $3  does not exist "
	exit $E_BADARGS
fi

sed -e "s/$old_pattern/$new_pattern/g" $filename
exit $?
