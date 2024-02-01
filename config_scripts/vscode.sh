#!/bin/bash

set -e

source "$HOME/Dotfiles/utils/functions.sh"
source "$HOME/Dotfiles/utils/constants.sh"

link_dir "$REPO_DOT_CONFIG_DIR/Code/User/settings.json" "$HOME/.config/Code/User/settings.json"
link_dir "$REPO_DOT_CONFIG_DIR/Code/User/keybindings.json" "$HOME/.config/Code/User/keybindings.json"