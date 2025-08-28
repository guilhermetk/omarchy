#!/bin/bash

# Parent script to remove both webapps and packages
# This script will call both remove-webapps.sh and remove-packages.sh

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=== Omarchy Removal Script ==="
echo "This script will remove webapps and packages as specified in their respective arrays."
echo

# Ask for confirmation
read -p "Are you sure you want to proceed? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Removal cancelled."
    exit 1
fi

echo "Starting removal process..."
echo

# Remove webapps
echo "=== Removing Webapps ==="
if [ -f "$SCRIPT_DIR/packaging/remove-webapps.sh" ]; then
    "$SCRIPT_DIR/packaging/remove-webapps.sh"
else
    echo "Warning: remove-webapps.sh not found"
fi

echo

# Remove packages
echo "=== Removing Packages ==="
if [ -f "$SCRIPT_DIR/remove-packages.sh" ]; then
    "$SCRIPT_DIR/remove-packages.sh"
else
    echo "Warning: remove-packages.sh not found"
fi

echo
echo "=== Removal Complete ==="
echo "All specified webapps and packages have been processed."