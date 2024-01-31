#!/bin/bash

set -e

source "$HOME/Dotfiles/utils/functions.sh"
source "$HOME/Dotfiles/utils/constants.sh"

link_service () {
    echo "Setting up systemd service: $1"
    link_config "$SYSTEMD_FILES_DIR" "/etc/systemd/system/$1"
}

enable_and_start () {
    sudo systemctl enable "$1"
    sudo systemctl start "$1"
}

# RUN

for service in "$SYSTEMD_FILES_DIR"/*
do
  link_config $service
  enable $service
done