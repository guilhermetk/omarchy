#!/bin/bash

# Array of packages to remove
# Edit this array to specify which packages you want to remove
PACKAGES_TO_REMOVE=(
  "kdenlive"
  "obs-studio"
  "obsidian"
  "signal-desktop"
  "typora"
  "xournalpp"
)

# Remove the specified packages
if [ ${#PACKAGES_TO_REMOVE[@]} -gt 0 ]; then
  echo "Removing packages: ${PACKAGES_TO_REMOVE[*]}"
  sudo pacman -R --noconfirm "${PACKAGES_TO_REMOVE[@]}"
else
  echo "No packages to remove."
fi

