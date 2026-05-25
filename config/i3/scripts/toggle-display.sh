#!/bin/sh
if xrandr | grep "HDMI-1 connected" | grep -v " disconnected" | grep -q "[0-9]\+x[0-9]\+"; then
    ~/.screenlayout/monitor.sh
else
    ~/.screenlayout/lap.sh
fi
