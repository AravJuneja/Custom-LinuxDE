#!/usr/bin/env python3
import colorsys, sys

def hex_to_rgb(h):
    h = h.lstrip('#')
    return tuple(int(h[i:i+2], 16) / 255.0 for i in (0, 2, 4))

def rgb_to_hex(r, g, b):
    return '#{:02x}{:02x}{:02x}'.format(int(r * 255), int(g * 255), int(b * 255))

def luminance(r, g, b):
    def lin(c): return c / 12.92 if c <= 0.03928 else ((c + 0.055) / 1.055) ** 2.4
    return 0.2126 * lin(r) + 0.7152 * lin(g) + 0.0722 * lin(b)

r, g, b = hex_to_rgb(sys.argv[1])
h, l, s = colorsys.rgb_to_hls(r, g, b)
dark = luminance(r, g, b) < 0.5

fg = '#f0ece0' if dark else '#1c1c1c'

l_alt = min(1.0, l + 0.12) if dark else max(0.0, l - 0.08)
bg_alt = rgb_to_hex(*colorsys.hls_to_rgb(h, l_alt, s))

# Use a fixed accent hue if background is nearly grayscale
if s < 0.1:
    primary = rgb_to_hex(*colorsys.hls_to_rgb(0.60, 0.62 if dark else 0.38, 0.65))
    secondary = rgb_to_hex(*colorsys.hls_to_rgb(0.02, 0.58 if dark else 0.42, 0.65))
else:
    s_acc = max(0.55, s)
    primary = rgb_to_hex(*colorsys.hls_to_rgb((h + 0.5) % 1.0, 0.65 if dark else 0.35, s_acc))
    secondary = rgb_to_hex(*colorsys.hls_to_rgb((h + 0.33) % 1.0, 0.60 if dark else 0.40, s_acc))

alert = rgb_to_hex(*colorsys.hls_to_rgb(0.10, 0.60 if dark else 0.45, 0.85))
dis_l = 0.52
disabled = rgb_to_hex(dis_l, dis_l, dis_l)

print(f"FG_COLOR={fg}")
print(f"BG_ALT_COLOR={bg_alt}")
print(f"PRIMARY_COLOR={primary}")
print(f"SECONDARY_COLOR={secondary}")
print(f"ALERT_COLOR={alert}")
print(f"DISABLED_COLOR={disabled}")
