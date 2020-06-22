#!/bin/bash

nitrogen --restore || pkill picom
sleep 1
picom -b --config ~/.config/picom/picom.conf

killall flashfocus
flashfocus
