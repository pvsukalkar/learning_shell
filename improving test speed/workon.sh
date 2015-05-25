#!/bin/sh
file=`echo $1 | sed 's/\(.*\)\.\(.*\)/\1/'`
ext=`echo $1 | sed 's/.*\.\(.*\)/\1/'`
if [ ! -f $1 ] ; then 
	if [ $ext = "pl" ] ; then 
		echo "#!/usr/bin/perl" > $1
	elif [ $ext = "py" ] ; then 
		echo "#!/usr/bin/python" > $1
	elif [ $ext = "c" ] ; then 
		echo "#include<stdio.h>" >> $1
		echo -e "int main()\n{\n\n} " >> $1
	elif [ $ext = "java" ] ; then 
		echo -e "public class $file {\n" >> $1
		echo -e "\tpublic static void main (String args[]){\n\n\t}\n}" >> $1
	else 
		echo "#!/bin/sh" > $1
	fi
fi 

while [ 1 ] ; do 
	vim $1
	chmod 755 $1
	if [ $ext = "java" ] ; then 
		javac $1
		[ $? -eq 0 ] && java $file 
	elif [ $ext = "c" ] ; then 
		gcc $1 
		[ $? -eq 0 ] && ./a.exe
	else 
		./$1
	fi
	read dummy
done
