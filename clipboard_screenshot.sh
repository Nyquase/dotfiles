#! /bin/bash
# Simple screenshot-to-clipboard script using maim and xclip

notify-send "Select area to screenshot"

maim -s --format=png /dev/stdout | xclip -selection clipboard -t image/png -i

if (( "${PIPESTATUS[0]}" == 0 )); then
  notify-send "Screenshot has been copied to clipboard"
else
  notify-send -i dialog-warning "Selection was cancelled by keystroke or right-click."
fi
