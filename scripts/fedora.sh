#!/bin/bash

# Fedora plymouth
sudo dnf install plymouth-theme-charge.x86_64
plymouth-set-default-theme -l
plymouth-set-default-theme charge

# keybindings

# Bind escape on Caps lock
xmodmap -e "clear lock" # disable caps lock switch
xmodmap -e "keysym Caps_Lock = Escape" # set caps_lock as escape