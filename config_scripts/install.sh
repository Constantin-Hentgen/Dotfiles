#!/bin/bash

# Set fail on error
set -e

echo "Updating system packages and repositories..."
sudo dnf update -y

# Functions for repeated actions
function install_dnf_package {
    echo "Installing DNF package: $1"
    sudo dnf install -y "$1"
}

function add_flatpak_repo {
    echo "Adding Flatpak repository: $1"
    flatpak remote-add --if-not-exists "$1" "$2"
}

function install_flatpak_app {
    echo "Installing Flatpak application: $1"
    flatpak install -y flathub "$1"
}

function add_repo {
    echo "Adding repository: $1"
    sudo dnf config-manager --add-repo "$1"
}

function import_gpg_key {
    echo "Importing GPG key from: $1"
    sudo rpm --import "$1"
}

function add_vscode_repo {
    echo "Adding Visual Studio Code repository"
    sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
}

# Flathub
install_dnf_package flatpak
add_flatpak_repo flathub https://flathub.org/repo/flathub.flatpakrepo

# Development Tools
install_dnf_package "zsh gcc gcc-c++ ninja-build bat python3"

# Package Management and Version Control Tools
install_dnf_package "git tldr"

# Productivity Tools
install_dnf_package "terminator tmux polybar picom polybar"

# Internet Brave Browser
install_dnf_package "dnf-plugins-core"
add_repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
import_gpg_key https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
install_dnf_package brave-browser

# Spotify
install_flatpak_app com.spotify.Client

# Visual Studio Code
import_gpg_key https://packages.microsoft.com/keys/microsoft.asc
add_vscode_repo
sudo dnf check-update
install_dnf_package code # or code-insiders

# Fonts
install_dnf_package "fira-code-fonts"
# Note: Manual download required for JetBrains Mono Nerd Font and FiraCode from Nerd Fonts

echo "Installation complete!"
