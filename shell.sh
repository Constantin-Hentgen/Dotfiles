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
install_zsh_autosuggestions() {
    echo "Installing Zsh autosuggestions plugin"
    local dest="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
    local zshrc="$HOME/.zshrc"
    local source_line="source $dest/zsh-autosuggestions.zsh"

    # Check if Zsh autosuggestions is already cloned
    if [ -d "$dest" ]; then
        echo "Zsh autosuggestions plugin is already installed. Skipping clone."
    else
        clone_git_repo "https://github.com/zsh-users/zsh-autosuggestions" "$dest"
    fi

    # Check if .zshrc already sources Zsh autosuggestions
    if grep -q "$source_line" "$zshrc"; then
        echo "Zsh autosuggestions plugin is already sourced in .zshrc. Skipping."
    else
        echo "$source_line" >> "$zshrc"
        echo "Zsh autosuggestions plugin source added to .zshrc."
    fi
}

# enable zsh history and ctrl+<-/-> to jump between words in zsh
create_zsh_history() {
  local history_file=~/.zsh_history
  local zshrc_file=~/.zshrc
  local histsize=10000
  local savehist=10000
  
  touch "$history_file"

  # Append the lines to the end of .zshrc
  echo "HISTFILE=~/.zsh_history" >> "$zshrc_file"
  echo "HISTSIZE=10000" >> "$zshrc_file"
  echo "SAVEHIST=10000" >> "$zshrc_file"
  echo "setopt appendhistory" >> "$zshrc_file"
  echo 'bindkey "^[[1;5C" forward-word' >> "$zshrc_file"
  echo 'bindkey "^[[1;5D" backward-word' >> "$zshrc_file"
}


# terminator configuration
link_dir "$REPO_DOT_CONFIG_DIR/terminator" "$HOME/.config/terminator"

# tmux configuration

# ZSH completion improved
add_zshrc_lines() {
  local zshrc_file="$HOME/.zshrc"

  # Check if .zshrc already exists
  if [ -f "$zshrc_file" ]; then
    # Check if the lines are already in .zshrc
    if grep -q "autoload -Uz compinit && compinit" "$zshrc_file" && grep -q "zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'" "$zshrc_file"; then
      echo "Lines are already in $zshrc_file."
    else
      # Append the lines to .zshrc
      echo "Adding lines to $zshrc_file..."
      echo "autoload -Uz compinit && compinit" >> "$zshrc_file"
      echo "zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'" >> "$zshrc_file"
      echo "Lines added to $zshrc_file."
    fi
  else
    # .zshrc doesn't exist, create it and add the lines
    echo "Creating $zshrc_file..."
    touch "$zshrc_file"
    echo "Adding lines to $zshrc_file..."
    echo "autoload -Uz compinit && compinit" >> "$zshrc_file"
    echo "zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'" >> "$zshrc_file"
    echo "Lines added to $zshrc_file."
  fi
}

# RUN
set_default_shell
install_powerlevel10k
install_zsh_autosuggestions
create_zsh_history
add_zshrc_lines
link_dir "$REPO_DIR/xkb.conf" "/etc/X11/xorg.conf.d/00-keyboard.conf"
