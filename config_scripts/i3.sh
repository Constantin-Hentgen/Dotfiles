#!/bin/bash

set -e

source "$HOME/Dotfiles/utils/functions.sh"
source "$HOME/Dotfiles/utils/constants.sh"

# Configure i3lock-color
configure_i3lock_color() {
    clone_git_repo "https://github.com/Raymo111/i3lock-color.git" "$HOME/i3lock_color"
    "$HOME/i3lock_color/install-i3lock-color.sh"
}

# Configure xborder
configure_xborder() {
    local repo_dir="$HOME/xborder"

    # Check if the repository directory already exists
    if [ -d "$repo_dir" ]; then
        echo "xborder repository already exists at $repo_dir. Skipping clone."
    else
        clone_git_repo "https://github.com/deter0/xborder" "$repo_dir"
    fi

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
link_dir "$REPO_DIR/xborder/config.json" "$HOME/xborder/config.json"

# rofi configuration
link_dir "$REPO_DOT_CONFIG_DIR/rofi" "$HOME/.config/rofi"

echo "i3 Setup completed successfully!"
