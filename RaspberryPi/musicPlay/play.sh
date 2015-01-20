#!/bin/bash
volume=-2800
num=1
sort -R "$@" > playlist
total_files=$(wc -l playlist | cut -d\  -f1)
echo "number of files to play:".$total_files
while true 
do	
	file=$(sed -n "$num"p playlist)
	num=$((num + 1))

	if [ "$file" = "" ]
	then
		break
	fi

	if [ $(echo "$file" | cut -c1) = "#" ]
	then 
		echo "skipping $file"
		continue
	fi
	echo "playing $file"
	omxplayer --vol $volume -o both "$file"

sleep 1
done
