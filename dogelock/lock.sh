#!/bin/sh

img=/tmp/screenlock.png
real_script=$(readlink $0)
doge=$(dirname ${real_script:-$0})/doge.png

echo $doge

scrot $img
convert $img -level 0%,100% \
	-gamma 0.16,0.15,0.15 \
	-filter Gaussian -resize 20% -define filter:sigma=0.6 -resize 500% \
	-font "Noto-Sans" -pointsize 40 -gravity center \
	$doge -gravity center -composite \
	$img

i3lock -f -i $img
#i3lock -f -u -i $img
