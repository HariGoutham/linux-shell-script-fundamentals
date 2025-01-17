#!/bin/bash

# Define the host to ping
HOST="google.com"

# Ping the host and check the exit status
ping -c 1 $HOST  # Send a single ping to the host

# Method 1: Check exit status using "$?"
if [ "$?" -eq "0" ]; then  # Check if the last command was successful
  echo "$HOST reachable."  # Host is reachable
else
  echo "$HOST unreachable."  # Host is not reachable
fi

# Method 2: Check exit status using "$?" with negation
ping -c 1 $HOST  # Send another ping to the host
if [ "$?" -ne "0" ]; then  # Check if the last command failed
  echo "$HOST unreachable."  # Host is not reachable
fi

# Method 3: Store exit status in a variable
ping -c 1 $HOST  # Send another ping to the host
RETURN_CODE=$?  # Store the exit status in a variable
if [ "$RETURN_CODE" -ne "0" ]; then  # Check if the command failed
  echo "$HOST unreachable."  # Host is not reachable
fi

# Method 4: Using logical AND (&&) to check success
ping -c 1 $HOST && echo "$HOST reachable."  # If ping is successful, print reachable

# Method 5: Using logical OR (||) to check failure
ping -c 1 $HOST || echo "$HOST unreachable."  # If ping fails, print unreachable

# Method 6: Check exit status and exit the script with a status code
ping -c 1 $HOST  # Send another ping to the host
if [ "$?" -ne "0" ]; then  # Check if the last command failed
  echo "$HOST unreachable."  # Host is not reachable
  exit 1  # Exit the script with a non-zero status
fi

exit 0  # Exit the script with a zero status indicating success