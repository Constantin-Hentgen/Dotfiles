#!/bin/bash

# Exit on any error
set -e

# Function to install DNF packages
install_dnf_packages() {
    echo "Installing packages: $@"
    sudo dnf install -y "$@"
}

# Function to clone and enter a Git repository
clone_git_repo() {
    local repo_url="$1"
    local dest_dir="$2"
    echo "Cloning repository: $repo_url"
    git clone "$repo_url" "$dest_dir"
    cd "$dest_dir"
}

# Backup and Replace Configuration
replace_config() {
    echo "Replacing configuration for: $1"
    local config_dir="$HOME/.config/$1"
    local backup_dir="$config_dir-backup-$(date +%Y%m%d%H%M%S)"
    if [ -d "$config_dir" ]; then
        echo "Existing configuration found for $1. Backing up to $backup_dir"
        mv "$config_dir" "$backup_dir"
    fi
    cp -r "$HOME/dotfiles/.config/$1" "$HOME/.config/"
}

# Install and Configure i3lock-color
install_i3lock_color() {
    install_dnf_packages autoconf automake cairo-devel fontconfig gcc libev-devel libjpeg-turbo-devel libXinerama libxkbcommon-devel libxkbcommon-x11-devel libXrandr pam-devel pkgconf xcb-util-image-devel xcb-util-xrm-devel
    local repo_dir="$HOME/i3lock-color"
    clone_git_repo "https://github.com/Raymo111/i3lock-color.git" "$repo_dir"
    "$repo_dir/install-i3lock-color.sh"
}

# Install Theme and Icons
install_theme_and_icons() {
    install_dnf_packages materia-gtk-theme papirus-icon-theme lxappearance
}

# Install and Configure xborder
install_xborder() {
    install_dnf_packages cairo-devel pkg-config python3-devel
    local repo_dir="$HOME/xborder"
    clone_git_repo "https://github.com/deter0/xborder" "$repo_dir"
    chmod +x "$repo_dir/xborders"
    pip install -r "$repo_dir/requirements.txt"
    "$repo_dir/xborders" --help
}

# Main execution starts here
# Replace i3 configuration
replace_config "i3"

# Change lock screen
install_i3lock_color

# Change theme and icons
install_theme_and_icons

# Configure borders
install_xborder

# Additional configurations and installations can be added here in a similar structured manner
# For config picom and polybar, similar functions can be created following the patterns above

# Install rofi
install_dnf_packages rofi

echo "i3 Setup completed successfully!"
