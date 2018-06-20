#!/bin/bash

if [ $1 = 'a' ]; then
  xrandr --output eDP1 --auto --primary \
     --output HDMI1 --auto --left-of eDP1 \
     --output HDMI2 --auto --rotate right --right-of eDP1
elif [ $1 = 'b' ]; then
  xrandr --output eDP1 --off \
     --output HDMI1 --auto --primary \
     --output HDMI2 --auto --rotate right --right-of HDMI1
else
  xrandr --output eDP1 --auto --primary \
    --output HDMI1 --off \
    --output HDMI2 --off
fi

xrandr
