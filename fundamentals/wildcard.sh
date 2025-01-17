#!/bin/bash

# This script demonstrates the use of wildcards to copy HTML files.

# Define source and destination directories
SOURCE_DIR="/var/www"
DEST_DIR="/var/www-just-html"

# Change to the source directory
cd "$SOURCE_DIR" || { echo "Failed to change directory to $SOURCE_DIR"; exit 1; }

# Using a wildcard to loop through all HTML files in the source directory
for FILE in *.html; do
    # Check if there are any HTML files
    if [ -e "$FILE" ]; then
        echo "Copying $FILE to $DEST_DIR"
        cp "$FILE" "$DEST_DIR"  # Copy the HTML file to the destination directory
    else
        echo "No HTML files found in $SOURCE_DIR"
        break  # Exit the loop if no HTML files are found
    fi
done

# Alternative method using wildcard with full path
for FILE in "$SOURCE_DIR"/*.html; do
    # Check if the file exists
    if [ -e "$FILE" ]; then
        echo "Copying $FILE to $DEST_DIR"
        cp "$FILE" "$DEST_DIR"  # Copy the HTML file to the destination directory
    else
        echo "No HTML files found in $SOURCE_DIR"
        break  # Exit the loop if no HTML files are found
    fi
done

# End of the script
echo "File copying completed."
exit 0  # Exit with a success status