#!/bin/bash

# Get current and maximum brightness levels
current_brightness=$(brightnessctl get)
max_brightness=$(brightnessctl max)

# Calculate brightness percentage
brightness_percentage=$(( 100 * current_brightness / max_brightness ))

echo "$brightness_percentage%"
