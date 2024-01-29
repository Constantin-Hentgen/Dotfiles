
#!/bin/bash

# install and enable flathub
sudo dnf install -y flatpack
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Development Tools
sudo dnf install -y gcc gcc-c++ ninja bat python

# Package Management and Version Control Tools
sudo dnf install -y flatpak git

# Productivity Tools
sudo dnf install -y nvim tmux logseq

# Internet Browsing Tool
sudo dnf install -y brave-browser

# Networking tools
sudo dnf install -y nmap, tcpdump

# System Resource Monitoring Tool
sudo dnf install -y btop

# Quick Reference Tool
sudo dnf install -y tldr

#  install spotify
flatpak install flathub com.spotify.Client

# VmWare
sudo dnf install @virtualization


# nerdfont : jetbrainsmono nerd font / firacode

    # download and install the font