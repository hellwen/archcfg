#!/bin/sh

TYPE=$1
if [ ! ${TYPE} ]; then
    TYPE=""
fi

echo "Change to ${TYPE}"

if [ "$TYPE" == "all" ]; then
  xrandr --output eDP1 --auto --primary \
     --output HDMI1 --auto --left-of eDP1 \
     --output HDMI2 --auto --rotate right --right-of eDP1
elif [ "$TYPE" == "dock" ]; then
  xrandr --output eDP1 --auto --primary \
     --output DP2-3 --auto --left-of eDP1 \
     --output DP2-1 --auto --rotate right --right-of eDP1
elif [ "$TYPE" == "show" ]; then
  xrandr --output eDP1 --auto --primary \
     --output HDMI1 --off \
     --output HDMI2 --auto --right-of eDP1
else
  xrandr --output eDP1 --auto --primary \
    --output DP2-1 --off \
    --output DP2-2 --off \
    --output DP2-3 --off \
    --output HDMI1 --off \
    --output HDMI1 --off \
    --output HDMI2 --off
fi

# xrandr
