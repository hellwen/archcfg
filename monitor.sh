#!/bin/bash

xrandr --output eDP1 --auto --primary \
  --output HDMI2 --auto --rotate right --right-of eDP1 \
  --output HDMI1 --auto --left-of eDP1

xrandr
