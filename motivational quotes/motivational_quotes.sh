#!/bin/sh
URL="http://www.brainyquote.com/quotes/topics/topic_motivational.html"
FILENAME="file.txt"
QUOTEFILE="quotes.txt"
`wget -O $FILENAME $URL`
FILTERTEXT="/quotes/quotes"
FILTER2="</li>"
`grep $FILTERTEXT $FILENAME | grep $FILTER2 > $QUOTEFILE`
`rm -rf $FILENAME `
LINES=`wc -l $QUOTEFILE`
LINES=${LINES%$QUOTEFILE}
rand_line=$((RANDOM % LINES))
i=0
while read line ; do
	if [[ $i -eq $rand_line ]] ; then 
	   positions=`echo -q $line | grep -aob '>' | grep -oE '[0-9]+'` 
	   count=`echo "$positions" | wc -l`
	   arr=($positions)
	   QUOTESTART=$((arr[1] - 2 ))
	   QUOTEEND=$((arr[2] - 6)) 
	   QUOTELEN=$((QUOTEEND - QUOTESTART))
	   AUTHORSTART=$((arr[4] - 2))
	   AUTHOREND=$((arr[5] - 6))
	   AUTHORLEN=$((AUTHOREND - AUTHORSTART))
	   QUOTE=${line:QUOTESTART:QUOTELEN}
	   AUTHOR=${line:AUTHORSTART:AUTHORLEN}
	   echo -e "\033[1;35m$QUOTE\033[0;37m \n \033[4;33m - $AUTHOR\033[0;37m"
	   break
	fi
	((i++))
done < $QUOTEFILE
