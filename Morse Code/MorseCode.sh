#!/bin/sh
read -p "This program converts plain text into morse code. Enter text that you want to convert to morse code\n" input
input=$(echo $input | tr 'a-z' 'A-Z')
echo "You entered: $input"
length=`echo "$input" | wc -c`
i=0
echo "Morse Code for your text is : "
while [[ i -lt $((length - 1 ))  ]]; do
	c=${input:i:1}
	case ${c} in
	   .) echo -ne ".-.-.- " ;;
	   -) echo -ne "-....- ";;
	   ' ') echo -ne "/ " ;;
	   *) replacement=`grep "$c" MorseCodes` 
	      replacement_arr=($replacement)
	      echo -ne "${replacement_arr[1]} "
	   ;; 
	esac
	((i++))
done
echo
