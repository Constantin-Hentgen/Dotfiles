#!/bin/bash

update_grub_settings() {
  local grub_file="/etc/default/grub"
  local new_line="GRUB_TIMEOUT=0"

  # Backup the original grub file
  cp "$grub_file" "$grub_file.bak"

  # Use sed to replace the entire line containing GRUB_TIMEOUT
  sed -i "/GRUB_TIMEOUT=/c\\$new_line" "$grub_file"

  # Run sudo update-grub to update the GRUB configuration
  echo "Running sudo update-grub..."
  sudo update-grub

  # Inform the user that the GRUB configuration has been updated
  echo "GRUB_TIMEOUT line has been updated in $grub_file."
}

update_grub_settings
