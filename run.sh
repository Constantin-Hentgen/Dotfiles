#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Define the base directory for scripts
SCRIPTS_DIR="$HOME/scripts"
SYSTEMD_FILES_DIR="$HOME/systemd_files"

# Function to run setup scripts
run_script() {
    local script_path="$1"
    echo "Running script: $script_path"
    if [[ -x "$script_path" ]]; then
        source "$script_path"
    else
        echo "Error: Script $script_path is not executable or not found"
        exit 1
    fi
}

# Function to setup systemd service
setup_systemd_service() {
    local service_file="$1"
    local service_name=$(basename "$service_file")
    echo "Setting up systemd service: $service_name"
    sudo cp "$service_file" /etc/systemd/system/
    sudo systemctl enable "$service_name"
    sudo systemctl start "$service_name"
}

echo "Starting setup..."

# Step 1: Install tools
run_script "$SCRIPTS_DIR/install.sh"

# Step 2: Configure environment
run_script "$SCRIPTS_DIR/i3.sh"
run_script "$SCRIPTS_DIR/shell.sh"

# Set up startup scripts
setup_systemd_service "$SYSTEMD_FILES_DIR/custom_bindings.service"

echo "Setup completed successfully!"
