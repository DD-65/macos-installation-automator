#!/bin/bash

# Iterate over every .pkg file in the current directory
for pkg in *.pkg; do
    # Check if there are any .pkg files
    if [ -f "$pkg" ]; then
        # Prompt the user for confirmation
        read -p "Do you want to install $pkg? [y/N] " response

        case $response in
            [Yy]* )
                # Run the installer command
                sudo installer -store -pkg "$pkg" -target /
                ;;
            * )
                # Skip if the response is not yes
                echo "Skipping $pkg"
                ;;
        esac
    else
        echo "No .pkg files found in the current directory."
        break
    fi
done

