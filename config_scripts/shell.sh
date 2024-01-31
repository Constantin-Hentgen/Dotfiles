#!/bin/bash

# Exit on any error
set -e

# Function to clone Git repository
clone_git_repo() {
    local repo_url="$1"
    local dest_dir="$2"
    echo "Cloning repository: $repo_url into $dest_dir"
    git clone "$repo_url" "$dest_dir"
}

# Set Zsh as the default shell
set_default_shell() {
    echo "Setting Zsh as the default shell"
    local shell_path
    shell_path=$(which zsh)
    if [ -z "$shell_path" ]; then
        echo "Zsh is not installed. Please install Zsh first."
        exit 1
    fi
    chsh -s "$shell_path"
}

# Install Powerlevel10k theme for Zsh
install_powerlevel10k() {
    echo "Installing Powerlevel10k theme"
    clone_git_repo "https://github.com/romkatv/powerlevel10k.git" "$HOME/powerlevel10k"
    echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
}

# Copy .oh-my-zsh config folder
link_oh_my_zsh_config() {
    echo "Linking .oh-my-zsh config folder"
    local backup_dir="$HOME/.oh-my-zsh-backup-$(date +%Y%m%d%H%M%S)"
    local repo_dir="/path/to/your/backup/.oh-my-zsh"

    # Backup existing .oh-my-zsh directory, if it exists
    if [ -d "$HOME/.oh-my-zsh" ]; then
        echo "Existing .oh-my-zsh directory found. Backing up to $backup_dir"
        mv "$HOME/.oh-my-zsh" "$backup_dir"
    fi

    # Create symbolic link
    if [ -d "$repo_dir" ]; then
        echo "Creating symbolic link for .oh-my-zsh"
        ln -s "$repo_dir" "$HOME/.oh-my-zsh"
    else
        echo "Error: Repository directory $repo_dir not found"
        exit 1
    fi
}


# Install Zsh autosuggestions plugin
install_zsh_autosuggestions() {
    echo "Installing Zsh autosuggestions plugin"
    local dest="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
    clone_git_repo "https://github.com/zsh-users/zsh-autosuggestions" "$dest"
    echo "source $dest/zsh-aut
