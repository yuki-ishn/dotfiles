#!/bin/bash

# ─────────────────────────────────────────────
# Spaces (inactive = subtle, active = focused)
# ─────────────────────────────────────────────

for space in $(yabai -m query --spaces | jq -r '.[].index'); do

  case $space in
    1) ICON="1" ;;
    2) ICON="2" ;;
    3) ICON="3" ;;
    4) ICON="4" ;;
    5) ICON="5" ;;
    *) ICON="$space" ;;
  esac

  sketchybar --add space space.$space left \
    --set space.$space \
      space=$space \
      icon="$ICON" \
      icon.font="JetBrainsMonoNL Nerd Font:Bold:13.0" \
      icon.padding_left=9 \
      icon.padding_right=9 \
      label.drawing=off \
      background.drawing=on \
      background.color=$TRANSPARENT \
      background.border_width=2 \
      background.border_color=$TRANSPARENT \
      icon.color=$ITEM_COLOR_DIM \
      script="$PLUGIN_DIR/spaces.sh" \
      click_script="yabai -m space --focus $space" \
    --subscribe space.$space space_change
done

# ─────────────────────────────────────────────
# Group spaces + front app into one visual unit
# ─────────────────────────────────────────────

sketchybar --add bracket spaces_group \
  space.1 space.2 space.3 space.4 space.5 front_app \
  --set spaces_group \
    padding_left=6 \
    padding_right=8 \
    background.drawing=off
