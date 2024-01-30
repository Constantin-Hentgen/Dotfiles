#!/bin/bash

# Disable Caps Lock
xmodmap -e "clear lock"

# Set Caps Lock as Escape
xmodmap -e "keysym Caps_Lock = Escape"
