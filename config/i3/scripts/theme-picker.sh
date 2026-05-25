#!/bin/bash

HEX=$(echo "" | rofi -dmenu -p "Theme color: #" -l 0)

[[ "$HEX" =~ ^[0-9a-fA-F]{6}$ ]] || exit 1

FONT=$(printf "black\nwhite" | rofi -dmenu -p "Font color:" -l 2)

case "$FONT" in
  black) FONT_COLOR="#000000" ;;
  white) FONT_COLOR="#ffffff" ;;
  *) exit 1 ;;
esac

printf 'BG_COLOR="#%s"\nFONT_COLOR="%s"\n' "$HEX" "$FONT_COLOR" > ~/.config/i3/theme.conf
~/.config/i3/scripts/apply-theme.sh
