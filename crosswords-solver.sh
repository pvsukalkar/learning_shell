#!/bin/sh
E_NOPATT=71
DICT=/usr/share/dict/linux.words
if [ -z "$1" ] ; then
	echo -e "Usage: $0 \"pattern\" " 
	echo "where pattern is xxx...x..x : here x is the known character and '.' represents unknown character " 
	echo "crossword.sh p..a. : here p and a are known characters and other characters are not known" 
	exit $E_NOPATT
fi  
grep ^"$1"$ "$DICT"
exit $?

