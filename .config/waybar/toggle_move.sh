#!/usr/bin/env bash

opened=$(hyprctl -j clients | gojq '.[] | select(.class == "Rofi")')

if [[ -n "$opened" ]]; then
    hyprctl dispatch closewindow "address:$(gojq -r '.address' <<< "$opened")"
else
    exec moveactivetoworkspace
fi
