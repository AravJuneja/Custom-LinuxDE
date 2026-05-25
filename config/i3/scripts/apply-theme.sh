#!/bin/bash

source ~/.config/i3/theme.conf

eval "$(python3 ~/.config/i3/scripts/gen-palette.py "$BG_COLOR")"
[[ -n "$FONT_COLOR" ]] && FG_COLOR="$FONT_COLOR"

POLYBAR="$HOME/.config/polybar/config.ini"
TERMINATOR="$HOME/.config/terminator/config"
FIREFOX_CSS="$HOME/snap/firefox/common/.mozilla/firefox/t1enq922.default/chrome/userChrome.css"
FIREFOX_CSS_WORK="$HOME/snap/firefox/common/.mozilla/firefox/2t6wubqv.work/chrome/userChrome.css"
FIREFOX_CSS_UMD="$HOME/snap/firefox/common/.mozilla/firefox/6upox9lv.UMD/chrome/userChrome.css"
LANDING="$HOME/myfolders/projects/landing_page/personal_landing_page.html"
UMD_LANDING="$HOME/myfolders/projects/landing_page/umd_landing_page.html"

# Polybar
sed -i "s/^background = #[0-9a-fA-F]*/background = $BG_COLOR/" "$POLYBAR"
sed -i "s/^background-alt = #[0-9a-fA-F]*/background-alt = $BG_ALT_COLOR/" "$POLYBAR"
sed -i "s/^foreground = #[0-9a-fA-F]*/foreground = $FG_COLOR/" "$POLYBAR"
sed -i "s/^primary = #[0-9a-fA-F]*/primary = $PRIMARY_COLOR/" "$POLYBAR"
sed -i "s/^secondary = #[0-9a-fA-F]*/secondary = $SECONDARY_COLOR/" "$POLYBAR"
sed -i "s/^alert = #[0-9a-fA-F]*/alert = $ALERT_COLOR/" "$POLYBAR"
sed -i "s/^disabled = #[0-9a-fA-F]*/disabled = $DISABLED_COLOR/" "$POLYBAR"

# Terminator
sed -i "s/background_color = \"#[0-9a-fA-F]*\"/background_color = \"$BG_COLOR\"/" "$TERMINATOR"
sed -i "s/foreground_color = \"#[0-9a-fA-F]*\"/foreground_color = \"$FG_COLOR\"/" "$TERMINATOR"
sed -i "s/cursor_fg_color = \"#[0-9a-fA-F]*\"/cursor_fg_color = \"$BG_COLOR\"/" "$TERMINATOR"

# Firefox userChrome.css
for css in "$FIREFOX_CSS" "$FIREFOX_CSS_WORK" "$FIREFOX_CSS_UMD"; do
  sed -i "s/--theme-bg: #[0-9a-fA-F]*/--theme-bg: $BG_COLOR/" "$css"
  sed -i "s/--theme-fg: #[0-9a-fA-F]*/--theme-fg: $FG_COLOR/" "$css"
  sed -i "s/--theme-bg-alt: #[0-9a-fA-F]*/--theme-bg-alt: $BG_ALT_COLOR/" "$css"
done

# Landing pages
sed -i "s/background-color: #[0-9a-fA-F]*/background-color: $BG_COLOR/" "$LANDING"
sed -i "s/background-color: #[0-9a-fA-F]*/background-color: $BG_COLOR/" "$UMD_LANDING"

# Wallpaper
WALLPAPER="$HOME/.config/wallpaper.png"
convert -size 1920x1080 xc:"$BG_COLOR" "$WALLPAPER"
feh --bg-scale "$WALLPAPER"

# Reload polybar
pkill polybar
sleep 0.5
~/.config/polybar/launch.sh &

echo "Theme applied: $BG_COLOR"
