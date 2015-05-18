#!/bin/sh
JAVAFILE="../GenerateRules/GenerateRules.java"
MODIFIERS=( private public protected )
PARANTHESIS="("
NOTNEEDED="="
i=0
`grep $PARANTHESIS $JAVAFILE | grep -v $NOTNEEDED > tempresult`
while [ $i -lt ${#MODIFIERS[@]} ] ; do
	`grep ${MODIFIERS[ $i ]} tempresult >> listOfFunctions`
	(( i++ ))
done
rm -rf tempresult
