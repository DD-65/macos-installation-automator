#!/bin/bash

# Prompt the user for the DMG file name
echo "Enter the path to the DMG file:"
read DMG_FILE

# Check if the file exists
if [[ ! -f "$DMG_FILE" ]]; then
    echo "File not found: $DMG_FILE"
    exit 1
fi

# Mount the DMG file
VOLUME=$(hdiutil attach -nobrowse "$DMG_FILE" |
    tail -n1 | cut -f3-; exit ${PIPESTATUS[0]}) &&
{
    # Create target directory on Seagate drive
    TARGET_DIR="/Volumes/Seagate_3/${DMG_FILE%.*}"
    mkdir -p "$TARGET_DIR"

    # Sync the .app files to /Applications with progress bar
    rsync -a --info=progress2 "$VOLUME"/*.app "$TARGET_DIR"; SYNCED=$?
    
    # Detach the volume and exit with the rsync status
    (hdiutil detach -force -quiet "$VOLUME" || exit $?) && exit "$SYNCED"
}
