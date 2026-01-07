#!/bin/sh

source "$CONFIG_DIR/colors.sh"

# Query yabai once and cache the result
SPACES_JSON=$(yabai -m query --spaces)

# Get the focused space index
FOCUSED=$(echo "$SPACES_JSON" | jq -r '.[] | select(."has-focus" == true) | .index')

# Build a single batch update command
UPDATE_CMD="sketchybar --animate tanh 20"

# Update all spaces in one command
for space in $(echo "$SPACES_JSON" | jq -r '.[].index'); do
  if [ "$space" = "$FOCUSED" ]; then
    UPDATE_CMD="$UPDATE_CMD --set space.$space \
      background.drawing=on \
      background.color=$ACCENT_COLOR \
      background.border_color=$ACCENT_COLOR \
      icon.color=$ITEM_COLOR"
  else
    UPDATE_CMD="$UPDATE_CMD --set space.$space \
      background.drawing=on \
      background.color=$TRANSPARENT \
      background.border_color=$TRANSPARENT \
      icon.color=$ACCENT_COLOR"
  fi
done

# Execute the batched update
eval "$UPDATE_CMD"
