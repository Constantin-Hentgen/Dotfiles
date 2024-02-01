#!/bin/bash

set -e

source "$HOME/Dotfiles/utils/functions.sh"
source "$HOME/Dotfiles/utils/constants.sh"

# Add a line to crontab for each script
for script in "$REPO_STARTUP_SCRIPTS_DIR"/*
do
    chmod +x "$script"
    crontab -r 2>/dev/null
    (crontab -l 2>/dev/null; echo "@reboot /bin/bash $script") | crontab -
done
