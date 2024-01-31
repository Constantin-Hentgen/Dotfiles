#!/bin/bash

set -e

source ../utils/functions.sh

echo "Updating system packages and repositories..."
sudo dnf update -y

echo "Adding Visual Studio Code repository"
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

# Flathub
install_dnf_packages flatpak
add_flatpak_repo flathub https://flathub.org/repo/flathub.flatpakrepo

# Development Tools
install_dnf_packages zsh gcc gcc-c++ ninja-build bat python3

# Package Management and Version Control Tools
install_dnf_packages git tldr

# Productivity Tools
install_dnf_packages terminator tmux polybar picom polybar

# Internet Brave Browser
install_dnf_packages dnf-plugins-core
add_repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
import_gpg_key https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
install_dnf_packages brave-browser

# Spotify
install_flatpak_app com.spotify.Client

# Visual Studio Code
import_gpg_key https://packages.microsoft.com/keys/microsoft.asc
add_vscode_repo
sudo dnf check-update
install_dnf_packages code

# Fonts
install_dnf_packages fira-code-fonts
# Note: Manual download required for JetBrains Mono Nerd Font and FiraCode from Nerd Fonts

echo "Installation complete!"
