#!/bin/sh
rotate_13(){
	local varname=$1 varvalue=$2
	eval $varname='$(echo "$varvalue" | tr a-z n-za-m)'
}
echo "enter string you want to rotate by 13 characters"
read text
rotate_13 var $text
echo "rotated string: $var " 

