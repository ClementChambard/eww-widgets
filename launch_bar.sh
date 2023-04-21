#!/bin/bash

EWW_DIR=$HOME/.config/eww

killall eww

NB_MONITORS=($(hyprctl monitors -j | jq -r '.[] | .id'))
echo $NB_MONITORS
for id in "${NB_MONITORS[@]}"; do
    # make top bar for every display
    bar="bar$id"
    echo $bar
    hyprctl dispatch focusmonitor "$id"
    eww -c $EWW_DIR/bar open "$bar"
    eww -c $EWW_DIR/menu daemon

done
