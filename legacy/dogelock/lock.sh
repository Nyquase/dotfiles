#!/bin/sh

real_script=$(readlink $0)
img=$(dirname ${real_script:-$0})/lockscreen.png

pkill -u "$USER" -USR1 dunst
i3lock -f -i $img
pkill -u "$USER" -USR2 dunst

# i3lock -f -u -i $img
