#!/bin/bash

# This script demonstrates various uses of the while loop in Bash.

# 1. Creating multiple directories
INDEX=1
while [ $INDEX -lt 6 ]; do
  echo "Creating project-${INDEX}"
  mkdir -p /usr/local/project-${INDEX}  # Use -p to avoid errors if the directory already exists
  ((INDEX++))  # Increment the index
done

# 2. Reading user input until confirmation
CORRECT=""
while [ "$CORRECT" != "y" ]; do
  read -p "Enter your name: " NAME
  read -p "Is ${NAME} correct? (y/n) " CORRECT
done

# 3. Checking if a service is up
while ping -c 1 app1 >/dev/null; do
  echo "app1 still up..."
  sleep 5  # Wait for 5 seconds before the next check
done
echo "app1 down, continuing."

# 4. Reading lines from a file and numbering them
LINE_NUM=1
while read -r LINE; do
  echo "${LINE_NUM}: ${LINE}"
  ((LINE_NUM++))  # Increment the line number
done < /etc/fstab  # Read from /etc/fstab

# 5. Processing specific lines from a file
FS_NUM=1
grep xfs /etc/fstab | while read -r FS MP REST; do
  echo "${FS_NUM}: file system: ${FS}"
  echo "${FS_NUM}: mount point: ${MP}"
  ((FS_NUM++))  # Increment the file system number
done

# 6. Displaying a menu until the user chooses to exit
while true; do
  read -p "1: Show disk usage.  2: Show uptime.  3: Exit. " CHOICE
  case "$CHOICE" in
    1)
      df -h  # Show disk usage
      ;;
    2)
      uptime  # Show system uptime
      ;;
    3)
      echo "Exiting."
      break  # Exit the loop
      ;;
    *) 
      echo "Invalid choice, please try again."
      ;;
  esac
done

# 7. Backing up databases
mysql -BNe 'show databases' | while read -r DB; do
  db-backed-up-recently "$DB"  # Check if the database has been backed up recently
  if [ "$?" -eq "0" ]; then
    continue  # Skip to the next database if it has been backed up
  fi
  backup "$DB"  # Backup the database
done

# End of the script
echo "Script execution completed."
exit 0  # Exit with a success status