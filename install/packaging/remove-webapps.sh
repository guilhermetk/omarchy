#!/bin/bash

# Array of webapps to remove
# Edit this array to specify which webapps you want to remove
WEBAPPS_TO_REMOVE=(
    "HEY"
    "Basecamp"
    "WhatsApp"
    "Google Photos"
    "Google Contacts"
    "Google Messages"
    "ChatGPT"
    "YouTube"
    "GitHub"
    "X"
    "Figma"
    "Discord"
    "Zoom"
)

# Remove the specified webapps
for webapp in "${WEBAPPS_TO_REMOVE[@]}"; do
    omarchy-webapp-remove "$webapp"
done