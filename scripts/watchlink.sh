#!/bin/sh

link=$(rofi -dmenu -l 1 -p "Link =>")
if [ -z $link ]; then
	:
else
	opts=$(echo -e "none\n--no-audio\n--no-video" | rofi -dmenu -l 3 -p "Playback Options")
	if [ "$opts" == "none" ];then
		echo "no opts provided"
		mpv --volume=50 $link
	else
		echo "opts provided"
		mpv --volume=50 $opts $link
	fi
fi

