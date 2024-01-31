#!/bin/bash

set -e

source "$HOME/Dotfiles/utils/constants.sh"

cd ~

echo "Starting setup..."

echo "Step 1: Installation"
source "$REPO_CONFIG_SCRIPTS_DIR/install.sh"

echo "Step 2: Configuration"
source "$REPO_CONFIG_SCRIPTS_DIR/shell.sh"

echo "Step 3: Set up startup scripts"
setup_systemd_service "$SYSTEMD_FILES_DIR/custom_bindings.service"

echo "Setup completed successfully!"
