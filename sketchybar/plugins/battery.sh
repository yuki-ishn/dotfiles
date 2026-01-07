#!/bin/sh

source "$CONFIG_DIR/colors.sh"

PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

if [ $PERCENTAGE = "" ]; then
  exit 0
fi

case ${PERCENTAGE} in
9[0-9] | 100)
  ICON="􀛨"
  COLOR=$ITEM_COLOR
  ;;
[6-8][0-9])
  ICON="􀺸"
  COLOR=$ITEM_COLOR
  ;;
[3-5][0-9])
  ICON="􀺶"
  COLOR=$ITEM_COLOR
  ;;
[1-2][0-9])
  ICON="􀛩"
  COLOR=$ITEM_COLOR
  ;;
*)
  ICON="􀛪"
  COLOR=$ITEM_COLOR
  ;;
esac

if [[ $CHARGING != "" ]]; then
  ICON="􀢋"
  COLOR=$ITEM_COLOR
fi

# The item invoking this script (name $NAME) will get its icon and label
# updated with the current battery status
sketchybar --animate sin 30 --set $NAME icon="$ICON" label="${PERCENTAGE}%" icon.color="$COLOR"
