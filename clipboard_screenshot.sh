#! /bin/bash
#
# Simple screenshot-to-clipboard script using maim and xclip
notify-send "Select area to screenshot" &&
maim -s --format=png /dev/stdout | xclip -selection clipboard -t image/png -i &&
notify-send "Screenshot has been copied to clipboard"
