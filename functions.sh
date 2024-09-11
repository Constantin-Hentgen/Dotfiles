#!/bin/bash

# Link Configurations with Symbolic Links
link_dir () {
    local src="$1"
    local dest="$2"
    echo "Linking configuration from $src to $dest"

    if [ -d "$dest" ]; then
        echo "Existing configuration found at $dest (being deleted)"
        sudo rm -rf $dest
    fi

    echo "Creating symbolic links for $dest"
    sudo ln -sfv "$src" "$dest"
}

clone_git_repo () {
    local repo_url="$1"
    local dest_dir="$2"
    echo "Cloning repository: $repo_url into $dest_dir"
    git clone "$repo_url" "$dest_dir"
}

install_dnf_packages () {
    echo "Installing DNF package: $@"
    sudo dnf install -y "$@"
}

add_repo () {
    echo "Adding repository: $1"
    sudo dnf config-manager --add-repo "$1"
}

import_gpg_key () {
    echo "Importing GPG key from: $1"
    sudo rpm --import "$1"
}

add_flatpak_repo () {
    echo "Adding Flatpak repository: $1"
    flatpak remote-add --if-not-exists "$1" "$2"
}

add_vscode_repo () {
    sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
    sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
}

install_flatpak_app () {
    echo "Installing Flatpak application: $1"
    flatpak install -y flathub "$1"
}