#!/bin/sh
key=ETAOINSHRDLUBCFGJMQPVWZYXK
echo "enter 1--> to encrypt and 2 --> to decrypt . Press Ctrl + D to stop taking input"
read choice
if [[ $choice -eq 1 ]] ; then 
	cat "$@" | tr "a-z" "A-Z" | tr "A-Z" "$key"
else 
	cat "$@" | tr "a-z" "A-Z" | tr "$key" "A-Z"
fi 
exit 0
