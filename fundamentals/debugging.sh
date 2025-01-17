#!/bin/bash

# Enable debugging options
set -e  # Exit immediately if a command exits with a non-zero status
set -x  # Print commands and their arguments as they are executed

# Define a variable for testing
TEST_VAR="test"
echo "TEST_VAR: $TEST_VAR"

# Demonstrate using set -v for verbose output
set -v  # Print shell input lines as they are read
echo "This is a verbose output example."
set +v  # Disable verbose output

# Demonstrate using PS4 for custom debug output
PS4='+ ${BASH_SOURCE}:${LINENO}:${FUNCNAME[0]}() '
set -x  # Enable debugging with custom PS4
echo "Debugging with PS4: $TEST_VAR"
set +x  # Disable debugging

# Function to demonstrate debugging with a function
debug() {
  echo "Executing: $@"
  "$@"  # Execute the command passed as arguments
}

# Use the debug function to run a command
debug ls

# Conditional debugging based on a variable
DEBUG=true

if $DEBUG; then
  echo "Debug mode ON."
else
  echo "Debug mode OFF."
fi

# Another way to check the DEBUG variable
$DEBUG && echo "Debug mode ON."

# Using the DEBUG variable to control output
DEBUG=false
$DEBUG || echo "Debug mode OFF."

# Example of using a command substitution with DEBUG
DEBUG="echo"
$DEBUG ls  # This will print "ls" instead of executing it

# Uncommenting the following line will cause an error if DEBUG is not set
# DEBUG="echo"
# $DEBUG ls  # This will not execute because DEBUG is not set

# Demonstrate a command with carriage returns (if applicable)
echo "This file contains carriage returns."  # Example line

# Final message
echo "Script execution completed."

: '
Explanation of Concepts Included:
Debugging Options:

set -e: Exit immediately if a command exits with a non-zero status.
set -x: Print commands and their arguments as they are executed.
set -v: Print shell input lines as they are read.
Custom Debugging Output:

PS4: Custom prompt for debugging output, showing the source file, line number, and function name.
Functions:

A debug function that prints the command being executed and then executes it.
Conditional Debugging:

Using a variable (DEBUG) to control whether debug messages are printed.
Command Substitution:

Using a variable to store a command (DEBUG="echo") and executing it.
Error Handling:

Demonstrating how to handle potential errors with set -e.
'