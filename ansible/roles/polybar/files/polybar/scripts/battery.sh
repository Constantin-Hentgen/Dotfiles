#!/bin/bash

# Get the battery percentage using upower
battery_info=$(upower -i $(upower -e | grep battery) | grep -E "percentage")
battery_level=$(echo $battery_info | grep -o '[0-9]\+')

echo "Battery $battery_level%"
