#This program was intended to learn : 
# 1) command on strings 
# 2) mathematical operations in shell (floating point)

#!/bin/sh
echo "Ever wondered how fast you would type if your speed were so and so... Well, anything which you wonder would have been your typing speed!!"
read speed
while [[ $speed -gt 1000 ]]; do
	echo "Be practical man ! Even the fastest typers in world don't type faster than 300 wpm "
	echo "Enter speed again "
	read speed	
done
echo "Give text which you would like to type at this speed.." 
read text 
words=($text)
word_count=${#words[@]}
character_count=`echo "$text" | wc -c`
((character_count--))
MINUTE=60
SLEEP_TIME=`echo "$MINUTE * $word_count / $speed / $character_count " | bc -l`
i=0
echo "This is how you would have printed if your speed were $speed wpm!!!"
while [[ $i -lt $((character_count )) ]] ; do  
	echo -ne "${text:i:1}"
	sleep $SLEEP_TIME
	(( i ++ ))
done
echo
