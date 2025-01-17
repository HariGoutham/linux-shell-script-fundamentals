#!/bin/bash  # This line tells the system to use Bash to run this script.

# Function to simulate starting a service
start_service() {
    echo "Service started."  # This message informs the user that the service has started.
}

# Function to simulate stopping a service
stop_service() {
    echo "Service stopped."  # This message informs the user that the service has stopped.
}

# Function to prompt the user for a yes/no answer
prompt_user() {
    read -p "Enter y or n: " ANSWER  # This line prompts the user to enter 'y' or 'n' and stores the input in the variable ANSWER.
    
    # This block checks the user's answer and responds accordingly.
    case "$ANSWER" in
        [yY]|[yY][eE][sS])  # This matches 'y', 'Y', 'yes', 'Yes', etc.
            echo "You answered yes."  # If the user answered yes, this message is displayed.
            ;;
        [nN]|[nN][oO])      # This matches 'n', 'N', 'no', 'No', etc.
            echo "You answered no."  # If the user answered no, this message is displayed.
            ;;
        *)                  # This matches any other input.
            echo "Invalid answer. Please enter 'y' or 'n'."  # If the input is invalid, this message is displayed.
            ;;
    esac
}

# Main script logic
# This block checks the first argument passed to the script (e.g., start, stop, prompt).
case "$1" in
    start|START)  # Accepts 'start' or 'START' (case insensitive).
        start_service  # Calls the function to start the service.
        ;;
    stop|STOP)    # Accepts 'stop' or 'STOP' (case insensitive).
        stop_service  # Calls the function to stop the service.
        ;;
    prompt)       # If the user wants to prompt for yes/no.
        prompt_user  # Calls the function to prompt the user.
        ;;
    *)            # Default case for invalid input.
        echo "Usage: $0 start|stop|prompt"  # Displays usage information.
        echo "Please provide one of the following commands: start, stop, or prompt."  # Additional guidance for the user.
        exit 1  # Exits the script with a non-zero status indicating an error.
        ;;
esac