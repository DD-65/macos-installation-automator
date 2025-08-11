#!/bin/bash

# Find .app files in the current directory and one subdirectory deep
while IFS= read -r FILENAME; do
    # Ask the user if they want to run the codesign commands on this file
    echo "Do you want to codesign $FILENAME? [y/N]"
    read -r ANSWER < /dev/tty

    # Check the user's answer
    if [[ $ANSWER =~ ^[Yy]$ ]]; then
        # Perform the commands on the file
        xattr -cr "$FILENAME" && codesign --force --deep --sign - "$FILENAME"

        # Check if the commands were successful
        if [ $? -eq 0 ]; then
            echo "Operation successful on $FILENAME"
        else
            echo "Operation failed on $FILENAME"
        fi
    else
        echo "Skipping $FILENAME"
    fi
done < <(find . -maxdepth 2 -name "*.app" -type d)

