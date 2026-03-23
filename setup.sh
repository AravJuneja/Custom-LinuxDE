#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing packages..."
sudo apt update
sudo apt install -y \
    i3 \
    polybar \
    rofi \
    terminator \
    feh \
    maim \
    xss-lock \
    i3lock \
    network-manager-gnome \
    brightnessctl \
    dex \
    x11-xserver-utils \
    pulseaudio-utils \
    jq \
    blueman \
    fonts-font-awesome

echo "Creating directories..."
mkdir -p \
    "$HOME/.config/i3/scripts" \
    "$HOME/.config/polybar" \
    "$HOME/.config/terminator" \
    "$HOME/Pictures/Wallpaper" \
    "$HOME/Pictures/Screenshots"

echo "Copying configs..."
cp "$REPO_DIR/config/i3/config"           "$HOME/.config/i3/config"
cp "$REPO_DIR/config/i3/lock.sh"          "$HOME/.config/i3/lock.sh"
cp "$REPO_DIR/config/i3/scripts/"*        "$HOME/.config/i3/scripts/"
cp "$REPO_DIR/config/polybar/config.ini"  "$HOME/.config/polybar/config.ini"
cp "$REPO_DIR/config/polybar/launch.sh"   "$HOME/.config/polybar/launch.sh"
cp "$REPO_DIR/config/polybar/battery.sh"  "$HOME/.config/polybar/battery.sh"
cp "$REPO_DIR/config/polybar/watts.sh"    "$HOME/.config/polybar/watts.sh"
cp "$REPO_DIR/config/terminator/config"   "$HOME/.config/terminator/config"

echo "Setting permissions..."
chmod +x \
    "$HOME/.config/i3/lock.sh" \
    "$HOME/.config/i3/scripts/"* \
    "$HOME/.config/polybar/launch.sh" \
    "$HOME/.config/polybar/battery.sh" \
    "$HOME/.config/polybar/watts.sh"

echo "Done. Place your wallpaper at ~/Pictures/Wallpaper/wallpaper.png then log into i3."
