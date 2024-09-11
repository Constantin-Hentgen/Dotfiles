#!/bin/bash

set -e

source "$HOME/Dotfiles/utils/functions.sh"

echo "Updating system packages and repositories..."
sudo dnf update -y

# Flathub
install_dnf_packages flatpak
add_flatpak_repo flathub https://flathub.org/repo/flathub.flatpakrepo

# Development Tools
install_dnf_packages curl zsh gcc gcc-c++ ninja-build bat python3 cairo-devel pkg-config python3-devel autoconf automake cairo-devel fontconfig gcc libev-devel libjpeg-turbo-devel libXinerama libxkbcommon-devel libxkbcommon-x11-devel libXrandr pam-devel pkgconf xcb-util-image-devel xcb-util-xrm-devel

# Package Management and Version Control Tools
install_dnf_packages git tldr

# Productivity Tools
install_dnf_packages terminator tmux polybar picom polybar rofi 

# Internet Brave Browser
install_dnf_packages dnf-plugins-core
add_repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
import_gpg_key https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
install_dnf_packages brave-browser

# Spotify
install_flatpak_app com.spotify.Client

# Fonts
install_dnf_packages fira-code-fonts

# i3 theme
https://github.com/adi1090x/polybar-themes
install_dnf_packages nitrogen

echo "Installation complete!"
