#!/usr/bin/env bash

# opened=$(hyprctl -j clients | gojq '.[] | select(.class == "Rofi")')
opened=$(hyprctl -j clients | gojq '.[] | select(.class == "wofi")')

if [[ -n "$opened" ]]; then
    hyprctl dispatch closewindow "address:$(gojq -r '.address' <<< "$opened")"
else
    # exec ~/.config/rofi/launchers/type-1/launcher.sh -me-select-entry '' -me-accept-entry MousePrimary
    exec uwsm app -- "$(wofi --show drun --define=drun-print_desktop_file=true)"
fi
