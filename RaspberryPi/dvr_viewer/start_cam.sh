#!/bin/bash
##USER CONFIGURATION
export ip="192.168.1.10:554"
export user="user"
export password=""

# channel numbers
cam_order[0]=2
cam_order[1]=1

#Grid Size
view=4

###################

close_all(){

for i in "${cam_pid[@]}"
do
	if [ $i -ne 0 ];then
		kill -9 $i
	fi
done
pkill omxplayer

}

start_all(){
j=0
for i in "${cam_order[@]}"
do
	./camera.sh $i $view $j &
	cam_pid[$j]=$!
	j=$((j + 1))

done

}

reset_pid(){
j=0
for i in "${cam_pid[@]}"
do
	cam_pid[$j]=0
	j=$((j + 1))
done


}

ch="0"
start_all

while true
do
	read -s -n 1 option
	if [ $ch != $option ] && [ $option != "0" ]  && [ $option != "q" ]
	then
		ch=$option
		close_all
		reset_pid
		./camera.sh $option 1 0 &
		cam_pid[$option]=$!
	fi

	if [ $option == "0" ] && [ $ch != $option ]
	then
		close_all
		ch="0"
		start_all
	fi

	if [ $option == "q" ]
	then
		close_all
		exit 0
	fi
done




