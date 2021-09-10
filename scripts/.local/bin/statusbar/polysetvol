#!/bin/bash

echo "$1 $2"
if [ $1 = "-i" ] && [ ! -z "$2" ] 
then
	echo "true"
	pactl set-sink-mute @DEFAULT_SINK@ false
	pactl set-sink-volume @DEFAULT_SINK@ "$2"
elif [ $1 = "-m" ] 
then
	pactl set-sink-mute @DEFAULT_SINK@ toggle
fi

polybar-msg hook volume 1
