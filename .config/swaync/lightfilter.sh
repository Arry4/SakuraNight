#!/bin/sh

STATE_FILE="/tmp/hyprsunset-toggle"

if [ -f "$STATE_FILE" ]; then
    hyprctl hyprsunset identity
    rm "$STATE_FILE"
else
    hyprctl hyprsunset temperature 2500
    touch "$STATE_FILE"
fi
