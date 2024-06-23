#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Enable debug mode to print each command before executing it
set -x

# Set the parent directory to the current directory
PARENT_DIR=$(pwd)

# Set the log and backup directories
LOG_DIR="$PARENT_DIR/myapp-logs"
BACKUP_DIR="$PARENT_DIR/backup_$(date +%Y%m%d)"
BACKUP_FILE="$BACKUP_DIR/myapp-backup.tar.gz"

# Get the current date and time
CURRENT_DATE_TIME=$(date +%Y%m%d-%H%M%S)

# Debug information
echo "Parent directory: $PARENT_DIR"
echo "Log directory: $LOG_DIR"
echo "Backup directory: $BACKUP_DIR"
echo "Backup file: $BACKUP_FILE"
echo "Current date and time: $CURRENT_DATE_TIME"

# Create the log directory if it doesn't exist
if [ ! -d "$LOG_DIR" ]; then
    echo "Log directory $LOG_DIR does not exist. Creating..."
    mkdir -p "$LOG_DIR"
else
    echo "Log directory $LOG_DIR already exists. Skipping creation."
fi

# Create the backup directory if it doesn't exist
if [ ! -d "$BACKUP_DIR" ]; then
    echo "Backup directory $BACKUP_DIR does not exist. Creating..."
    mkdir -p "$BACKUP_DIR"
else
    echo "Backup directory $BACKUP_DIR already exists. Skipping creation."
fi

# Create new log files with date-time in their names
LOG1_FILE="$LOG_DIR/log_"$CURRENT_DATE_TIME".txt"
LOG2_FILE="$LOG_DIR/log_"$CURRENT_DATE_TIME"_2.txt"

echo "Creating new log files: $LOG1_FILE and $LOG2_FILE..."

ps -ef | grep "vscode" | awk -F " " '{print $1}' > "$LOG1_FILE"
free >> "$LOG1_FILE"
date > "$LOG2_FILE"

# Archive log files and move to the backup directory
tar -czf "$BACKUP_FILE" -C "$LOG_DIR" .

# Disable debug and exit on error mode
set +e
set +x

# Set environment variable
BACKUP_STATUS="SUCCESS"
echo "Backup status: $BACKUP_STATUS"

# Check if backup was successful
if [ -f "$BACKUP_FILE" ]; then
    echo "Backup was successful."
else
    echo "Backup failed."
    BACKUP_STATUS="FAILURE"
fi

# Unset the environment variable
unset BACKUP_STATUS
echo "BACKUP_STATUS variable has been unset."

echo "End of the script."
