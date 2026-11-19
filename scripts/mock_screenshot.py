#!/usr/bin/env python3
"""Render example terminal screenshots (dark + light) from palette.json.

python3 scripts/mock_screenshot.py
"""
import json
import os

import numpy as np
from PIL import Image, ImageDraw, ImageFont

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FONT_PATHS = [
    "/data/data/com.termux/files/home/.termux/font.ttf",
    "/data/data/com.termux/files/usr/share/fonts/TTF/DejaVuSansMono.ttf",
    "/data/data/com.termux/files/usr/share/fonts/TTF/SymbolsNerdFontMono-Regular.ttf",
]
FONT = next((p for p in FONT_PATHS if os.path.exists(p)), FONT_PATHS[1])

F_SEC = ImageFont.truetype(FONT, 13)
F_MAIN = ImageFont.truetype(FONT, 17)
F_TITLE = ImageFont.truetype(FONT, 17)
F_LOGO = ImageFont.truetype(FONT, 145)
W, H = 1920, 1080


def hexrgb(hx):
    hx = hx.lstrip("#")
    return tuple(int(hx[i:i + 2], 16) for i in (0, 2, 4))


def gradient(variant, bg):
    yy, xx = np.indices((H, W), dtype=np.float32)
    cx, cy = W * 0.72, H * 0.18
    radius = W * 0.85
    dist = np.sqrt((xx - cx) ** 2 + (yy - cy) ** 2) / radius
    fade = np.clip(1.0 - dist, 0.0, 1.0)
    if variant == "dark":
        top = np.array([42, 36, 15], np.float32)
        bot = np.array(bg, np.float32)
    else:
        top = np.array([232, 222, 170], np.float32)
        bot = np.array(bg, np.float32)
    grad = bot + (top - bot) * (fade * 0.72)[..., None]
    noise = np.random.default_rng(7).normal(0, 1.4, grad.shape)
    return np.clip(grad + noise, 0, 255).astype(np.uint8)


def rounded(draw, box, radius, **kwargs):
    draw.rounded_rectangle(box, radius=radius, **kwargs)


def render(variant):
    cfg = json.load(open(os.path.join(ROOT, "palette.json")))["variants"][variant]
    term = cfg["terminal"]
    ed = cfg["editor"]
    acc = cfg["accents"]
    bg, fg = hexrgb(term["background"]), hexrgb(term["foreground"])
    surface, border, comment = hexrgb(ed["surface"]), hexrgb(ed["border"]), hexrgb(ed["comment"])
    gold, gold2, green, red = hexrgb(acc["primary"]), hexrgb(acc["secondary"]), hexrgb(cfg["ansi"][2]), hexrgb(acc["error"])
    img = Image.fromarray(gradient(variant, bg))
    draw = ImageDraw.Draw(img)

    x0, y0, x1, y1 = 120, 95, 1800, 985
    rounded(draw, [x0, y0, x1, y1], 18, fill=surface, outline=border, width=3)
    draw.rectangle([x0, y0 + 54, x1, y0 + 54], fill=bg)
    for cx, color in [(x0 + 28, red), (x0 + 56, gold), (x0 + 84, green)]:
        draw.ellipse([cx - 8, y0 + 21, cx + 8, y0 + 37], fill=color)
    draw.text((x0 + 135, y0 + 17), "kitty  —  yellen", font=F_TITLE, fill=fg)

    tx, ty = x0 + 62, y0 + 94
    draw.text((tx, ty), "❯ fastfetch", font=F_MAIN, fill=gold)
    ty += 54
    draw.text((tx, ty), "fastfetch — Yellen preview", font=F_SEC, fill=comment)

    logo_x, logo_y = tx, ty + 190
    draw.text((logo_x, logo_y), "Y", font=F_LOGO, fill=gold)
    draw.text((logo_x + 8, logo_y + 136), "YELLEN", font=F_MAIN, fill=fg)
    draw.text((logo_x + 8, logo_y + 164), "one palette.json", font=F_SEC, fill=comment)

    col_x = tx + 430
    lines = [
        ("OS", "Arch Linux x86_64"),
        ("Host", "workstation"),
        ("Kernel", "Linux 6.8.0-arch1-1"),
        ("Uptime", "3h 42m"),
        ("Packages", "1842 (pacman)"),
        ("Shell", "zsh 5.9"),
        ("Resolution", "1920x1080"),
        ("Terminal", "kitty 0.35.1"),
        ("Font", "DejaVu Sans Mono 10"),
        ("WM", "Hyprland"),
        ("Theme", "yellen 1.0.0"),
        ("Icons", "Papirus-Dark"),
    ]
    for i, (key, value) in enumerate(lines):
        y = ty + 34 + i * 43
        draw.text((col_x, y), key, font=F_MAIN, fill=gold)
        draw.text((col_x + 170, y), value, font=F_MAIN, fill=fg)

    chips = [
        ("Kitty", cfg["ansi"][2]),
        ("Ghostty", cfg["ansi"][3]),
        ("Alacritty", cfg["ansi"][4]),
        ("Vim", cfg["ansi"][5]),
        ("Neovim", cfg["ansi"][6]),
        ("bat", cfg["ansi"][1]),
    ]
    pill_fg_for = lambda color: (17, 20, 8) if np.mean(np.array(hexrgb(color))) > 150 else (245, 234, 184)
    cx = x0 + 60
    cy = y1 - 132
    for label, color in chips:
        width = 19 + 17 * len(label)
        rounded(draw, [cx, cy, cx + width, cy + 36], 18, fill=hexrgb(color))
        draw.text((cx + 15, cy + 9), label, font=F_SEC, fill=pill_fg_for(color))
        cx += width + 16

    draw.rectangle([x0, y1 - 56, x1, y1], fill=bg)
    draw.text((x0 + 36, y1 - 41), "tmux 0:zsh  1:nvim", font=F_SEC, fill=comment)
    draw.text((x1 - 285, y1 - 41), f"YELLEN · {variant}", font=F_SEC, fill=gold)

    out = os.path.join(ROOT, "docs", f"terminal-{variant}.png")
    img.save(out)
    print("wrote", out, img.size)


for variant in ("dark", "light"):
    render(variant)
