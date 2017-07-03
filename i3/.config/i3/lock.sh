#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Invalid arguments!"
    exit 1
fi

# do a blur
if [ $1 = "blur" ]; then
    img=/tmp/lock.png
    scrot -q 1 $img
    convert $img -blur 0x1.5 $img
    i3lock -i $img
    rm $img
    exit 0
fi

# do a bluescreen
if [ $1 = "win" ]; then
    img=/home/tronje/.config/i3/windoze.png
    i3lock -u -p win -i $img
    exit 0
fi
