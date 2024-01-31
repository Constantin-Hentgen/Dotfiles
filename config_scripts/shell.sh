#!/bin/bash

set -e

source "$HOME/Dotfiles/utils/functions.sh"

# Set Zsh as the default shell
set_default_shell () {
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

    local p10k_dir="$HOME/powerlevel10k"
    local zshrc="$HOME/.zshrc"
    local p10k_theme_line='source ~/powerlevel10k/powerlevel10k.zsh-theme'

    # Check if Powerlevel10k is already installed
    if [ -d "$p10k_dir" ]; then
        echo "Powerlevel10k is already installed. Skipping clone."
    else
        clone_git_repo "https://github.com/romkatv/powerlevel10k.git" "$p10k_dir"
    fi

    # Check if .zshrc already sources Powerlevel10k
    if grep -q "$p10k_theme_line" "$zshrc"; then
        echo "Powerlevel10k theme is already sourced in .zshrc. Skipping."
    else
        echo "$p10k_theme_line" >> "$zshrc"
        echo "Powerlevel10k theme source added to .zshrc."
    fi
}


# Install Zsh autosuggestions plugin
install_zsh_autosuggestions () {
    echo "Installing Zsh autosuggestions plugin"
    local dest="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
    clone_git_repo "https://github.com/zsh-users/zsh-autosuggestions" "$dest"
    echo "source $dest/zsh-aut"
}

# RUN
set_default_shell
install_powerlevel10k
install_zsh_autosuggestions