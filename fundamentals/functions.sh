#!/bin/bash

# Function Definition and Basic Function Call
function hello() {
    echo "Hello!"  # Print a greeting message
}

hello  # Call the hello function

# Function with Nested Function Calls
function hello() {
    echo "Hello!"  # Print a greeting message
    now  # Call the now function
}

function now() {
    echo "It's $(date +%r)"  # Print the current time
}

hello  # Call the hello function, which in turn calls now

# Function Call Before Definition (This will cause an error)
function hello() {
    echo "Hello!"  # Print a greeting message
    now  # Call the now function
}

# Uncommenting the following line will cause an error since now() is not defined yet
# hello

function now() {
    echo "It's $(date +%r)"  # Print the current time
}

# Function with Parameters
function hello() {
    echo "Hello $1"  # Print a greeting message with the first argument
}

hello Jason  # Call the hello function with "Jason" as an argument

# Function with Multiple Arguments
function hello() {
    for NAME in "$@"; do  # Loop through all arguments
        echo "Hello $NAME"  # Print a greeting for each name
    done
}

hello Jason Dan Ryan  # Call the hello function with multiple names

# Global Variables
my_function() {
    echo "$GLOBAL_VAR"  # Print the value of the global variable
}

GLOBAL_VAR=1  # Define a global variable
my_function  # Call the function; it will print the value of GLOBAL_VAR

# Global Variable Scope
my_function() {
    echo "$GLOBAL_VAR"  # Print the value of the global variable
}

# The value of GLOBAL_VAR is NOT available to my_function since GLOBAL_VAR was defined after my_function was called.
my_function  # This will print nothing or an empty line
GLOBAL_VAR=1  # Define the global variable after the function call

# Global Variable Availability After Function Call
my_function() {
    GLOBAL_VAR=1  # Define a global variable inside the function
}

# GLOBAL_VAR not available yet.
echo "GLOBAL_VAR value BEFORE my_function called: $GLOBAL_VAR"  # This will print nothing

my_function  # Call the function to set GLOBAL_VAR

# GLOBAL_VAR is NOW available
echo "GLOBAL_VAR value AFTER my_function called: $GLOBAL_VAR"  # This will print "1"

# Local Variables
my_function() {
    local LOCAL_VAR=1  # Define a local variable
    echo "LOCAL_VAR can be accessed inside of the function: $LOCAL_VAR"  # Print the local variable
}

my_function  # Call the function

# LOCAL_VAR is not available outside of the function.
echo "LOCAL_VAR can NOT be accessed outside of the function: $LOCAL_VAR"  # This will print nothing

# Function with Error Handling
function backup_file() {
    # This function creates a backup of a file.

    # Make sure the file exists.
    if [ -f "$1" ]; then
        # Make the BACKUP_FILE variable local to this function.
        local BACKUP_FILE="/tmp/$(basename ${1}).$(date +%F).$$"  # Create a backup file name
        echo "Backing up $1 to ${BACKUP_FILE}"  # Print the backup message

        # The exit status of the function will be the exit status of the cp command.
        cp "$1" "$BACKUP_FILE"  # Copy the file to the backup location
    else
        # The file does not exist, so return a non-zero exit status.
        return 1  # Indicate failure
    fi
}

# Call the function to backup /etc/hosts
backup_file /etc/hosts

# Make a decision based on the exit status of the function.
if [ $? -eq "0" ]; then  # Check the exit status of the last command
    echo "Backup succeeded!"  # Print success message
else
    echo "Backup failed!"  # Print failure message
    # Abort the script and return a non-zero exit status.
    exit 1  # Exit with an error status
fi