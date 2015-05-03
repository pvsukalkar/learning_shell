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
    #c=`printf '\\\\0%o' $[RANDOM%57+33]`   #storing octal value greater than \033
    #\033[23  --> means print something on 23rd line from top. \033[24 --> means print something from 24th line from top 
    #\033[32m --> for green color
    if [[ i%2 -eq 0]] ; then 
       c=0
    else 
       c=1
    fi 
    #printing $c in green color on jth column of (i-1)th line, and making color white again on ith line
    #H can be replaced by f. It is used for horizontal positioning. 
    echo -e "\033[$[i-1];${j}H\033[32m$c\033[$i;${j}H\033[37m"$c    
    sleep 0.1
    #creating vertical rain of length d
    if [ $i -ge $d ] ; then
    	echo -e "\033[$[i-d];${j}H "    
    fi 
  done
  
  #clearing the d length rain, so that screen doesn't get full
  for i in `eval echo -e {$[i-d]..$R}`; do
	echo -e "\033[$i;${j}f "
        sleep 0.1
  done
)&     #this process is running in background
sleep 0.05
done
