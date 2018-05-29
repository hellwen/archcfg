#!/bin/bash

# /etc/X11/xorg.conf.d/10-monitor.conf
# xrandr --output HDMI1 --auto --left-of eDP1

# get info from xrandr
connectedOutputs=$(xrandr | grep " connected" | sed -e "s/\([A-Z0-9]\+\) connected.*/\1/")
disconnectedOutputs=$(xrandr | grep " disconnected" | sed -e "s/\([A-Z0-9]\+\) disconnected.*/\1/")
activeOutput=$(xrandr | grep -E " connected (primary )?[1-9]+" | sed -e "s/\([A-Z0-9]\+\) connected.*/\1/" | head -1)

# initialize variables
execute="xrandr --output $activeOutput --auto --primary"
i=1
switch=0

for display in $connectedOutputs
do
    # check whether the next output should be switched on
    if [ $display = $activeOutput ]
    then
        continue
    fi

    execute="$execute --output $display --auto --right-of $activeOutput"
done

for display in $disconnectedOutputs
do
    execute="$execute --output $display --off"
done

# check if the default setup needs to be executed then run it
echo ""
echo "Resulting Configuration:"
echo $execute
# `$execute`

echo ""
echo "Resulting Status:"
echo -e "\n$(xrandr)"
