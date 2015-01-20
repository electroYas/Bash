#!/bin/sh
#for file in "$@"
for file in ./*
do
	format=$(echo "$file" | sed 's/^.*\.//')
	if [ $format = "mp4" ]
	then
		$(avconv -i "$file" -vn -ab 128k "$file".mp3)
	fi
done
