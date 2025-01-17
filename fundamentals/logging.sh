#!/bin/bash

# Enable verbose logging
VERBOSE=false  # Set to true to enable verbose logging

# Define constants
HOST="google.com"  # Host to fetch data from
PID="$$"  # Current process ID
PROGRAM_NAME="$0"  # Name of the script
THIS_HOST=$(hostname)  # Current hostname

# Function to log messages
logit() {
    local LOG_LEVEL=$1  # First argument is the log level
    shift  # Remove the first argument
    MSG=$@  # Remaining arguments are the message
    TIMESTAMP=$(date +"%Y-%m-%d %T")  # Get the current timestamp

    # Log the message if the log level is ERROR or if VERBOSE is enabled
    if [ "$LOG_LEVEL" = 'ERROR' ] || $VERBOSE; then
        echo "${TIMESTAMP} ${THIS_HOST} ${PROGRAM_NAME}[${PID}]: ${LOG_LEVEL} ${MSG}"
    fi

    # Optionally log to syslog using the logger command
    logger -p local0.info "${LOG_LEVEL}: ${MSG}"  # Log to syslog
}

# Example usage of logger command
logger "This is a simple log message."  # Log a simple message
logger -p local0.info "This is an info message."  # Log with priority
logger -s -p local0.info "This is a message with stderr output."  # Log with stderr output
logger -t myscript -p local0.info "This is a tagged message."  # Log with a tag
logger -i -t myscript "This is a message with a unique identifier."  # Log with a unique identifier

# Log an informational message
logit INFO "Processing data."

# Simulate fetching data from a host
fetch-data() {
    # Simulate a command that may fail
    ping -c 1 "$1" > /dev/null 2>&1  # Ping the host
}

# Attempt to fetch data from the specified host
fetch-data "$HOST" || logit ERROR "Could not fetch data from $HOST"

# Log script completion
logit INFO "Script execution completed."