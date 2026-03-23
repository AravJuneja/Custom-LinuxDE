#!/usr/bin/env bash

BAT="/sys/class/power_supply/BAT0"

if [[ -r "$BAT/power_now" ]]; then
    power=$(<"$BAT/power_now")
    watts=$(awk -v p="$power" 'BEGIN { printf("%.2f", p / 1000000) }')
    echo "${watts}W"
elif [[ -r "$BAT/current_now" && -r "$BAT/voltage_now" ]]; then
    current=$(<"$BAT/current_now")
    voltage=$(<"$BAT/voltage_now")
    watts=$(awk -v c="$current" -v v="$voltage" 'BEGIN { printf("%.2f", (c * v) / 1000000000000) }')
    echo "${watts}W"
else
    echo "Watt info N/A"
    exit 1
fi
