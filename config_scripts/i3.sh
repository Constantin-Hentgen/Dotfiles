#!/bin/bash

set -e

source "$HOME/Dotfiles/utils/functions.sh"
source "$HOME/Dotfiles/utils/constants.sh"

# Configure i3lock-color
configure_i3lock_color() {
    local repo_dir="$HOME/$USER/i3lock-color"
    clone_git_repo "https://github.com/Raymo111/i3lock-color.git" "$repo_dir"
    "$repo_dir/install-i3lock-color.sh"
}

# Configure xborder
configure_xborder() {
    local repo_dir="$HOME/$USER/xborder"
    clone_git_repo "https://github.com/deter0/xborder" "$repo_dir"
    chmod +x "$repo_dir/xborders"
    pip install -r "$repo_dir/requirements.txt"
    "$repo_dir/xborders" --help
}

# i3 configuration
link_dir "$REPO_DOT_CONFIG_DIR/i3" "$HOME/.config/i3"

# picom configuration
link_dir "$REPO_DOT_CONFIG_DIR/picom" "$HOME/.config/picom"

# i3lock_color configuration
configure_i3lock_color

# polybar configuration
link_dir "$REPO_DOT_CONFIG_DIR/polybar" "$HOME/.config/polybar"

# xborder configuration
configure_xborder
link_dir "$REPO_DIR/xborder/config.json" "$HOME/border/config.json"

# rofi configuration
link_dir "$REPO_DIR/rofi" "$HOME/.config/rofi"

echo "i3 Setup completed successfully!"
