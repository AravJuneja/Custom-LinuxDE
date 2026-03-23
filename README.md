# Custom-LinuxDE

This is my daily driver setup running on my Dell laptop, which I use for all my university work. I run i3wm as my window manager with polybar for the status bar and terminator as my terminal. It's lightweight, stays out of the way, and keeps everything keyboard driven so I can focus on getting work done.

## Setup

Clone the repo and run the setup script:

```bash
git clone https://github.com/AravJuneja/Custom-LinuxDE.git
cd Custom-LinuxDE
chmod +x setup.sh
./setup.sh
```

Then place your wallpaper at `~/Pictures/Wallpaper/wallpaper.png` and log into i3.

## Keybinds

| Key | Action |
|-----|--------|
| `Mod + Enter` | Open terminal |
| `Mod + D` | App launcher (rofi) |
| `Mod + B` | Open Firefox (profile picker) |
| `Mod + Shift + Q` | Close window |
| `Mod + Shift + S` | Screenshot (select area) |
| `Mod + Shift + B` | Toggle reading mode |
| `Mod + M` | Toggle gaps |
| `Mod + T` | Rename workspace |
| `Mod + N` | Reset workspace name |
| `Mod + Shift + N` | Reset all workspace names |
| `Mod + Shift + E` | Exit i3 |
| `Mod + Shift + R` | Restart i3 |
