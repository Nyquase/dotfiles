#!/bin/sh

img=/tmp/screenlock.png
real_script=$(readlink $0)
doge=$(dirname ${real_script:-$0})/doge.png

scrot -z -o $img
convert $img -level 0%,100% \
	-gamma 0.16,0.15,0.15 \
	-filter Gaussian -blur 0x8 -resize 20% -define filter:sigma=0.6 -resize 500% \
	$doge -gravity center -composite \
	$img

pkill -u "$USER" -USR1 dunst
i3lock -f -i $img
pkill -u "$USER" -USR2 dunst

#i3lock -f -u -i $img
