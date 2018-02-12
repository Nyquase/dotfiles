#!/bin/bash
battery_level=`acpi -b | grep -P -o '[0-9]+(?=%)'`
if [ $battery_level -le 25 ]; then
    notify-send "Battery is low" "Charging: ${battery_level}%" -i /usr/share/icons/Adwaita/32x32/status/battery-caution.png
    #amixer -q sset Master 50%
    aplay -q $HOME/.config/polybar/Batt.wav
fi
