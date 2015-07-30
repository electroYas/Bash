#!/bin/bash
for file in "$@"
do
    format=$(echo "$file" | sed 's/^.*\.//')
    echo "Filename:"$file
    echo "Format:"$format
    filename=$(echo "$file" | sed 's/\(^.*\)\..*$/\1/')
    echo "Filename without extension:"$filename
    avconv -i "$file" -f mp3 -acodec libmp3lame -ab 192000 -ar 44100 "$filename".mp3
done 
