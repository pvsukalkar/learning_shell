#!/bin/sh
PASSES=500
ROWS=10
RANGE=3
POS=0
RANDOM=$$

declare -a Slots
NUMSLOTS=21
Initialize_slots (){
	for i in $( seq $NUMSLOTS )
	do
		Slots[$i]=0
	done
	echo
}
Show_slots(){
	echo; echo
	echo -n " " 
	for i in $( seq $NUMSLOTS ) ; do 
		printf "%3d" ${Slots[$i]}
	done
	echo
	echo -e " |__|__|__|__|__|__|__|__|__|__|__|__|__|__|__|__|__|__|__|__|__|"
	echo "                                ||"
	echo
}
Move(){
	Move=$RANDOM
	let "Move %= RANGE"
	case "$Move" in 
	0) ;;
	1) ((POS--));;
	2) ((POS++));;
	*) echo -n "Error: ";;
	esac
}
Play(){
	i=0
	while [ "$i" -lt "$ROWS" ] ; do
		Move 
		((i++))
	done
	SHIFT=11
	let "POS += $SHIFT"
	(( Slots[$POS]++ )) 
}
Run(){
	p=0
	while [ "$p" -lt "$PASSES" ] ; do 
		Play
		(( p++ )) 
		POS=0
	done
}
Initialize_slots
Run
Show_slots
