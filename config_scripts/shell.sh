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
# Note: You need to specify where and how you're copying this. Assuming you have a backup ready:
copy_oh_my_zsh_config() {
    echo "Copying .oh-my-zsh config folder"
    cp -r /path/to/your/backup/.oh-my-zsh ~/
}

# Install Zsh autosuggestions plugin
install_zsh_autosuggestions() {
    echo "Installing Zsh autosuggestions plugin"
    local dest="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
    clone_git_repo "https://github.com/zsh-users/zsh-autosuggestions" "$dest"
    echo "source $dest/zsh-aut
