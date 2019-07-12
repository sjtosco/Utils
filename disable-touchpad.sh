#!/bin/bash
#
# Purpose: Toggle synaptic touchpad on/off
# Author: Fazle Arefin
# Reference: http://ubuntuforums.org/showthread.php?t=1536305
#

TOUCHPADID=11    # change this id

SYNSTATE=$(xinput list-props "$TOUCHPADID" | grep "Device Enabled" | grep -Eo '.$')
if [ $SYNSTATE = 0 ]; then 
    xinput set-prop "$TOUCHPADID" "Device Enabled" 1
    notify-send -i  "/home/tosco/.local/share/icons/misc/touchpad.png" "Touchpad ON"
else 
    xinput set-prop "$TOUCHPADID" "Device Enabled" 0
    notify-send -i  "/home/tosco/.local/share/icons/misc/touchpad.png" "Touchpad OFF"
fi

