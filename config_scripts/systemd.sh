#!/bin/bash

set -e

source "$HOME/Dotfiles/utils/functions.sh"
source "$HOME/Dotfiles/utils/constants.sh"

link_service () {
    echo "Setting up systemd service: $1"
    link_config "$1" "/etc/systemd/system/$(basename $1)"
}

enable_and_start () {
    sudo systemctl enable $(basename "$1")
    sudo systemctl start $(basename "$1")
}

# RUN

for service in "$REPO_SYSTEMD_FILES"/*
do
  link_service $service 
  enable $service
done