#!/usr/bin/env bash

PROFILE_INI="$HOME/snap/firefox/common/.mozilla/firefox/profiles.ini"
OUT="$HOME/.config/i3/firefox-mode.conf"

mapfile -t profiles < <(awk -F= '/^\[Profile/ { section=1 } /^Name=/ && section { print $2 }' "$PROFILE_INI")

[ ${#profiles[@]} -eq 0 ] && exit 1

# Build mode label: "1. PERSONAL  2. UNIVERSITY  3. WORK"
label=""
for i in "${!profiles[@]}"; do
    label+="$((i+1)). ${profiles[$i]}  "
done
label="${label%  }"  # trim trailing spaces

{
    echo "set \$firefox_mode \"$label\""
    echo "mode \$firefox_mode {"
    for i in "${!profiles[@]}"; do
        echo "    bindsym $((i+1)) exec --no-startup-id firefox -P \"${profiles[$i]}\" --no-remote, mode \"default\""
    done
    echo "    bindsym Escape mode \"default\""
    echo "    bindsym Return mode \"default\""
    echo "}"
} > "$OUT"
