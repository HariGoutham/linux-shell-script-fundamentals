#!/bin/bash

# This script performs user account archiving and demonstrates various Bash scripting concepts.

# Function to archive a user
archive_user() {
    local USER=$1  # The first parameter is the user.
    echo "Executing script: $0"
    echo "Archiving user: $USER"

    # Lock the account
    passwd -l "$USER"

    # Create an archive of the home directory.
    tar cf /archives/${USER}.tar.gz /home/${USER}
}

# Main body of the script
echo "Welcome to the User Archiving Script!"

# Check if any arguments are provided
if [ "$#" -gt 0 ]; then
    # Loop through all provided user arguments
    for USER in "$@"; do
        archive_user "$USER"  # Call the function to archive each user
    done
else
    # Prompt for a user name if no arguments are provided
    read -p "Enter a user name: " USER
    archive_user "$USER"  # Archive the user entered
fi

# Demonstrating variable usage
MY_SHELL="bash"
echo "I like the ${MY_SHELL} shell."

# Display the server name
SERVER_NAME=$(hostname)
echo "You are running this script on ${SERVER_NAME}."

# Conditional statements based on shell preference
if [ "$MY_SHELL" = "bash" ]; then
    echo "You seem to like the bash shell."
else
    echo "You don't seem to like the bash shell."
fi

# Loop through a list of colors
COLORS="red green blue"
for COLOR in $COLORS; do
    echo "COLOR: $COLOR"
done

# Sleep for a specified duration
echo "Sleeping for 90 seconds..."
sleep 90

# End of the script
echo "Script execution completed."
exit 0  # Exit with a success status