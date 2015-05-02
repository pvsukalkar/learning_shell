#!/bin/sh
#clearing terminal
echo -e "\033[2J\033[?251"

#getting size of terminal
R=`tput lines`
C=`tput cols`

#: is special-built in POSIX character. It is similar to true 
: $[R--]

#printing random characters
while true ; do
( 
  j=$[RANDOM%C]       #j deals with columns
  d=$[RANDOM%R]       #d deals with rows or lines
  for i in `eval echo -e {1..$R}`; do   #'eval' is used to execute command by joining parts in shell
    c=`printf '\\\\0%o' $[RANDOM%57+33]`   #storing octal value greater than \033
    #\033[23  --> means print something on 23rd line from top. \033[24 --> means print something from 24th line from top 
    #\033[32m --> for green color
    echo -e "\033[$[i-1];${j}H\033[32m$c\033[$i;${j}H\033[37m"$c   #Don't know exactly why 'H' is added 
    sleep 0.1
    if [ $i -ge $d ] ; then
    	echo -e "\033[$[i-d];${j}H "    
    fi 
  done
  
  for i in `eval echo -e {$[i-d]..$R}`; do
	echo -e "\033[$i;${j}f "
        sleep 0.1
  done
)&     #this process is running in background
sleep 0.05
done