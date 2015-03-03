#!/bin/bash
# William Thing
# CSE 373 Hw3 Part 2
# Jan 26, 2015

if [ "$#" -lt 2 ]
then
	echo "Error: Not enough arguments"
	exit
fi

if [ ! -f "$1" ]
then
	echo "Error: $1 does not exist"
else
	grep 'http' "$1" > "$2"
	sed -i 's/.*http:\/\//http:\/\//' "$2"
	sed -i 's/".*//' "$2"
	sed -i '/equiv\|100\|_\|babel/d' "$2"
fi	


