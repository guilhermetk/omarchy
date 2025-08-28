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
    
    # Clean up leftover desktop files and user data
    echo "Cleaning up leftover files..."
    for package in "${PACKAGES_TO_REMOVE[@]}"; do
        # Remove desktop files (case insensitive)
        find ~/.local/share/applications/ -iname "*${package}*" -name "*.desktop" -delete 2>/dev/null
        find /usr/share/applications/ -iname "*${package}*" -name "*.desktop" -delete 2>/dev/null || true
        
        # Remove icons
        find ~/.local/share/icons/ -iname "*${package}*" -delete 2>/dev/null || true
        find ~/.local/share/pixmaps/ -iname "*${package}*" -delete 2>/dev/null || true
        
        # Clean up common config directories
        rm -rf ~/.config/"${package}" 2>/dev/null || true
        rm -rf ~/.local/share/"${package}" 2>/dev/null || true
        rm -rf ~/."${package}" 2>/dev/null || true
        
        echo "Cleaned up files for: $package"
    done
else
    echo "No packages to remove."
fi

