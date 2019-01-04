#!/bin/bash

result=0

get_volume() {
    line=`amixer sget Master`
    regex="\[([0-9]+)%\]"
    if [[ $line =~ $regex ]]; then
        result="${BASH_REMATCH[1]}"
    fi
}

trap "get_volume" USR1

get_volume
while true; do 
    echo $result
    sleep 10 &
    wait
    get_volume
done
