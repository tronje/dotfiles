#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Invalid arguments!"
    exit 1
fi

# do a blur
if [ $1 = "blur" ]; then
    img=/tmp/lock.png
    lock=/home/tronje/.config/i3/lock_resized.png
    scrot $img
    # convert $img -blur 0x3 $img
    convert $img -filter Gaussian -resize 50% -define filter:sigma=2 -resize 200% $img
    composite -gravity center $lock $img $img
    i3lock -u -i $img
    rm $img
    exit 0
fi

# do a bluescreen
if [ $1 = "win" ]; then
    img=/home/tronje/.config/i3/windoze.png
    i3lock -u -p win -i $img
    exit 0
fi
