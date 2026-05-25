#!/bin/bash

WALLPAPER_ORIG=~/Pictures/Wallpaper/wallpaper.png
WALLPAPER_GRAY=/tmp/wallpaper_gray.png
STATE_FILE=/tmp/wallpaper_grayscale_state

if [ -f "$STATE_FILE" ]; then
    feh --bg-scale "$WALLPAPER_ORIG"
    rm "$STATE_FILE"
else
    convert "$WALLPAPER_ORIG" -colorspace Gray "$WALLPAPER_GRAY"
    feh --bg-scale "$WALLPAPER_GRAY"
    touch "$STATE_FILE"
fi
