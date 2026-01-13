#!/bin/sh

source "$CONFIG_DIR/colors.sh"

# Query yabai once
SPACES_JSON=$(yabai -m query --spaces)

# Focused space index
FOCUSED=$(echo "$SPACES_JSON" | jq -r '.[] | select(."has-focus" == true) | .index')

# Batch update (smooth animation)
UPDATE_CMD="sketchybar --animate tahn 16"

for space in $(echo "$SPACES_JSON" | jq -r '.[].index'); do
  if [ "$space" = "$FOCUSED" ]; then
    # Active space
    UPDATE_CMD="$UPDATE_CMD --set space.$space \
      background.drawing=on \
      background.color=$ACCENT_COLOR \
      background.border_color=$ACCENT_COLOR \
      icon.color=$ITEM_COLOR"
  else
    # Inactive spaces (SUBTLE)
    UPDATE_CMD="$UPDATE_CMD --set space.$space \
      background.drawing=on \
      background.color=$TRANSPARENT \
      background.border_color=$TRANSPARENT \
      icon.color=$ITEM_COLOR_DIM"
  fi
done

eval "$UPDATE_CMD"
