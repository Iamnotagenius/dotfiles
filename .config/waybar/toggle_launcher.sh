#!/usr/bin/env bash

opened=$(hyprctl -j clients | gojq '.[] | select(.class == "Rofi")')

if [[ -n "$opened" ]]; then
    hyprctl dispatch closewindow "address:$(gojq -r '.address' <<< "$opened")"
else
    exec ~/.config/rofi/launchers/type-1/launcher.sh -x11 -me-select-entry '' -me-accept-entry MousePrimary
fi
