#!/bin/bash

channel=$1
view=$2
order=$3

screen_width=1280
screen_height=1024

#calculation of the window size and offset position
sqrt=$(echo "sqrt($view)" | bc)

width=$(($screen_width / $sqrt - 3))
height=$(($screen_height / $sqrt - 3))
offset_x=$((($screen_width / $sqrt) * ( $order % $sqrt ) ))
offset_y=$((($screen_height / $sqrt) * ( $order / $sqrt ) ))

echo width:$width
echo height:$height
echo offset_x:$offset_x
echo offset_y:$offset_y
#calculation of the coordinates for the window.
(( x1 = offset_x ))
(( y1 = offset_y ))
(( x2 = width + offset_x ))
(( y2 = height + offset_y ))

while true
do
	echo "Starting Ch:"$channel
       
	omxplayer --win $x1,$y1,$x2,$y2 -b --live "rtsp://"$ip"/user="$user"&password="$password"&channel="$channel"&stream=0.sdp?real_stream--rtp-caching=100"
	
	echo "Ch:"$channel" not working. Reconnecting..."        
	sleep 2
done

