#!/bin/bash

set -e

source "$HOME/Dotfiles/utils/constants.sh"

echo "Starting setup..."

echo "Step 1: Installation"
source "$REPO_CONFIG_SCRIPTS_DIR/install.sh"

echo "Step 2: Configuration"
source "$REPO_CONFIG_SCRIPTS_DIR/shell.sh"
source "$REPO_CONFIG_SCRIPTS_DIR/i3.sh"
source "$REPO_CONFIG_SCRIPTS_DIR/vscode.sh"
source "$REPO_CONFIG_SCRIPTS_DIR/grub.sh"

echo "Setup completed successfully! Now reboot :)"
