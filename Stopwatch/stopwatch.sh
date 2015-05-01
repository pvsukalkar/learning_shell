#!/bin/sh
#These escape codes 'LIGHT_GREEN', 'LIGHT_BLUE', 'RED' can be used to give corresponding color to 
#printed text
LIGHT_GREEN='\033[1;32m'
LIGHT_BLUE='\033[1;34m'
RED='\033[0;31m'
NC='\033[0m'  
echo -e "Hi Pavan!!! Enter \n1 --> Stopwatch\n2 --> Lap Time \n3 --> Timer"
read option
case ${option} in
   1)
   echo "Starting stopwatch..."
   echo "Enter P to pause and Ctrl+c to stop "
   BEGIN="$(date +%s)"
   while true; do
        NOW=$(date +%s)
        DIFF=$(($NOW - $BEGIN))
        MINS=$(($DIFF / 60))
        SECS=$(($DIFF % 60))
        HOURS=$(($DIFF / 3600))
        DAYS=$(($DIFF / 86400))

        # \r  is a "carriage return" - returns cursor to start of line
        printf "\r%3d ${LIGHT_GREEN}Days${NC},${LIGHT_BLUE}%02d:%02d:%02d${NC}" $DAYS $HOURS $MINS $SECS
        read -t 0.25 pause
        if [[ "$pause" == "P" ]] ; then
            CURRENT_TIME=$(date +%s)
            PAUSE_TIME=$((CURRENT_TIME - BEGIN))
            read input
            while [[ $input != "P"  ]] ; do
               echo "Enter P to restart"
               read input
            done
            RESTART_TIME=$(date +%s)
            BEGIN=$((RESTART_TIME - PAUSE_TIME ))
        fi
   done ;;
   2) 	echo "Starting Lap timer..." 
      	echo "Enter L to start new lap"
	LAPCOUNTER=1
	echo -e "Starting ${RED}Lap $LAPCOUNTER ... ${NC} "
      	BEGIN="$(date +%s)"
     	while true; do
	   NOW=$(date +%s) 
      	   DIFF=$(($NOW - $BEGIN))
	   MINS=$(($DIFF / 60))
 	   SECS=$(($DIFF % 60))
	   HOURS=$(($DIFF / 3600))
 	   DAYS=$(($DIFF / 86400))
 	printf "\r%3d ${LIGHT_GREEN}Days${NC},${LIGHT_BLUE}%02d:%02d:%02d${NC}" $DAYS $HOURS $MINS $SECS
   	#sleep 0.25
#read -t <time> : this would wait <time> seconds for user's input 
	   read -t 0.25 stopper
	   if [[ $stopper == "L"  ]]; then
	   	BEGIN=$(date +%s)
		LAPCOUNTER=$((LAPCOUNTER+1))
	        echo -e "Starting ${RED}Lap $LAPCOUNTER ... ${NC} "
	   fi 
	done
        ;;
   3) echo "How long do you want timer? Enter minutes"
	read minutes
	echo "Timer starting for $minutes minute(s)"
	BEGIN=$(date +%s)
	END=$((BEGIN + $minutes * 60))
	REMAINING_TIME=$((END-BEGIN))
	while [[ REMAINING_TIME -gt 0 ]]; do
	     MINS=$((REMAINING_TIME / 60))
	     SECS=$((REMAINING_TIME % 60))
	printf "\r${RED}%02d:${LIGHT_GREEN}%02d${NC}" $MINS $SECS
	sleep 0.25
	CURRENT_TIME=$(date +%s)
	REMAINING_TIME=$((END-CURRENT_TIME))
        done
	COUNT=10
	while [[ $COUNT -gt 0 ]]; do
#echo -e "\a" produces beep sound
	   echo -e "\a"
	   sleep 0.5
	   COUNT=$((COUNT-1))
	done
   ;;
   *) echo "you entered wrong option" ;;
esac


