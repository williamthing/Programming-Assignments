#!/bin/bash
# William Thing
# CSE 374 Hw3 Part 1
# Jan, 25, 2015

if [ "$#" -lt 1 ]
then
	>&2 echo  "Error: Not enough Arguments found"
	exit 1
fi

file=$(mktemp)
wget "$1" -q -O "$file"

if [ "$?" -eq 1 ]
then
	rm -r "$file"
	>&2 echo "0"
	exit 1
else
	wc -c < "$file"
	rm -r "$file"
fi
	
