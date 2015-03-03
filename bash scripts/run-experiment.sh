#./bin/bash
# William Thing
# CSE374 Hw3 Part 3
# Jan 25, 2015

let rank=0
while read line
do
	echo "Performing measurement on $line"
	let size=$(./perform-measurement.sh "$line")
	let rank=$rank+1
	if [ $size -gt 0 ]
	then
		echo "...success"
		echo "$rank $line $size"  >>"$2"
	else
		echo "...failure"
	fi
done < "$1"


