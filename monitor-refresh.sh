#!/bin/bash

# /etc/X11/xorg.conf.d/10-monitor.conf
# xrandr --output HDMI1 --auto --left-of eDP1

# get info from xrandr
connectedOutputs=$(xrandr | grep " connected" | sed -e "s/\([A-Z0-9]\+\) connected.*/\1/")
activeOutput=$(xrandr | grep -E " connected (primary )?[1-9]+" | sed -e "s/\([A-Z0-9]\+\) connected.*/\1/")

# initialize variables
execute="xrandr --output $activeOutput --auto"
i=1
switch=0

for display in $connectedOutputs
do
    # check whether the next output should be switched on
    if [ $display = $activeOutput ]
    then
        continue
    fi

    execute="$execute --output $display --auto --left-of $activeOutput"
done

# check if the default setup needs to be executed then run it
echo ""
echo "Resulting Configuration:"
echo $execute
`$execute`

echo ""
echo "Resulting Status:"
echo -e "\n$(xrandr)"
