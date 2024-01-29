#!/bin/bash

cd ~

# Step 1 : Install tools
source ./scripts/install.sh

# Step 2 : Configure
source ./scripts/i3.sh
source ./scripts/shell.sh
source ./scripts/nvim.sh
source ./scripts/fedora.sh