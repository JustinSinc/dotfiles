#!/bin/bash

currentbrightness=`cat /sys/class/backlight/nv_backlight/brightness`
raisedbrightness=$(( $currentbrightness - 5 ))

if (($currentbrightness > 4)); then
    echo $raisedbrightness > /sys/class/backlight/nv_backlight/brightness
    exit 1
else
    exit 1
fi
