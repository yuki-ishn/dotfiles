#!/bin/bash

# Create spaces for yabai
SPACES=()

for space in $(yabai -m query --spaces | jq -r '.[].index | @sh' | tr -d "'"); do
  SPACES+=($space)

  case $space in
    1) ICON="静" ;;
    2) ICON="観" ;;
    3) ICON="今" ;;
    4) ICON="在" ;;
    5) ICON="念" ;;
    *) ICON="$space" ;; # fallback if more spaces exist
  esac

  sketchybar --add space space.$space left \
    --set space.$space \
    space=$space \
    icon="$ICON" \
    icon.padding_left=10 \
    icon.padding_right=10 \
    label.padding_right=0 \
    label.padding_left=0 \
    icon.font="JetBrainsMonoNL Nerd Font:Bold:13.0" \
    icon.highlight_color=$TN_CYAN \
    background.color=$TRANSPARENT \
    background.border_width=2 \
    background.border_color=$TRANSPARENT \
    background.drawing=on \
    script="$PLUGIN_DIR/spaces.sh" \
    click_script="yabai -m space --focus $space" \
    --subscribe space.$space space_change
done

sketchybar --add item space_separator left \
  --set space_separator \
  icon="" \
  icon.color=$ACCENT_COLOR \
  icon.padding_left=4 \
  icon.padding_right=8 \
  label.drawing=off \
  background.drawing=off \
  script="$PLUGIN_DIR/spaces.sh" \
  --subscribe space_separator space_change
