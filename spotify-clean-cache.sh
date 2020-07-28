#!/usr/bin/env bash
# Clean Spotify cache

# Path to Spotify cache directory
CACHE_DIR="$HOME/.cache/spotify/Data"

# Check that cache directory is valid
[[ -d "$CACHE_DIR" ]] || { echo "Invalid directory: $CACHE_DIR"; exit 11; }

# Show space used by Spotify cache
echo
du -h -d0 "$CACHE_DIR"

# Ask for confirmation to clean cache
echo
read -p "Clean all files in cache? (y/n) " -r CONFIRM
echo
[[ ${CONFIRM} =~ ^[Yy]$ ]] || exit 12

# Show files deletion command and ask for confirmation
read -p "rm $CACHE_DIR/*/* (y/n) " -r CONFIRM
[[ ${CONFIRM} =~ ^[Yy]$ ]] || exit 21
rm $CACHE_DIR/*/* || exit 22

# Show sub-directories deletion command and ask for confirmation
read -p "rmdir $CACHE_DIR/* (y/n) " -r CONFIRM
[[ ${CONFIRM} =~ ^[Yy]$ ]] || exit 31
rmdir $CACHE_DIR/* || exit 32

# Done
exit 0

# TODO: handle empty cache case better

