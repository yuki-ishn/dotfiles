#!/bin/bash

export TRANSPARENT=0x00ffffff

# -- TokyoNight Night --
# Palette reference: https://github.com/folke/tokyonight.nvim (style = "night")
# base=#1a1b26, crust=#15161e
# text=#c0caf5, blue=#7aa2f7, cyan=#7dcfff, purple(lavender)=#bb9af7, orange(peach)=#ff9e64, yellow=#e0af68, green=#9ece6a, red=#f7768e

# TokyoNight Night ARGB colors (0xAARRGGBB)
export TN_BASE=0x90000000   # 35% opacity black bar background
export TN_TEXT=0xffc0caf5
export TN_CRUST=0xff15161e
export TN_BLUE=0xff7aa2f7
export TN_CYAN=0xff7dcfff
export TN_LAVENDER=0xffbb9af7
export TN_ORANGE=0xffff9e64
export TN_YELLOW=0xffe0af68
export TN_GREEN=0xff9ece6a
export TN_RED=0xfff7768e
export TN_BORDER=0xff3b4261

# Item/icon/label color (dark text on bright accent backgrounds)
export ITEM_COLOR=0xff15161e   # crust (near-black)
export ITEM_COLOR_DIM=0xff6b7089

# Accent/background color for item highlights
export ACCENT_COLOR=0xffffffff # white

# Previous schemes (kept for reference):
# -- White Scheme --
# export ITEM_COLOR=0xff000000
# export ACCENT_COLOR=0xffffffff

# -- Teal Scheme --
# export ITEM_COLOR=0xff000000
# export ACCENT_COLOR=0xff2cf9ed

# -- Purple Scheme --
# export ITEM_COLOR=0xff000000
# export ACCENT_COLOR=0xffeb46f9

# -- Red Scheme ---
# export ITEM_COLOR=0xff000000
# export ACCENT_COLOR=0xffff2453

# -- Blue Scheme ---
# export ITEM_COLOR=0xff000000
# export ACCENT_COLOR=0xff15bdf9

# -- Green Scheme --
# export ITEM_COLOR=0xff000000
# export ACCENT_COLOR=0xff1dfca1

# -- Orange Scheme --
# export ITEM_COLOR=0xffffffff
# export ACCENT_COLOR=0xfff97716

# -- Yellow Scheme --
# export ITEM_COLOR=0xff000000
# export ACCENT_COLOR=0xfff7fc17
