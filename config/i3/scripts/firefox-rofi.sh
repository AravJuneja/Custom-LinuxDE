#!/usr/bin/env bash

PROFILE_INI="$HOME/snap/firefox/common/.mozilla/firefox/profiles.ini"

profiles=$(awk -F= '
/^\[Profile/ { section=1 }
/^Name=/ && section { print $2 }
' "$PROFILE_INI")

[ -z "$profiles" ] && exit 1

chosen=$(echo "$profiles" | rofi -dmenu -p "Firefox profile")
[ -z "$chosen" ] && exit 0

firefox -P "$chosen" --no-remote &
