#!/bin/bash

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
