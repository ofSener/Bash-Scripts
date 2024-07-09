# Log and Backup Script
This script creates logs and backs them up in the current directory. It ensures that each log file is unique by appending the current date and time to the filenames. The backup is stored in a directory named with the current date.

# Script Explanation

# Setup Directories:
LOG_DIR: Directory for log files.
BACKUP_DIR: Directory for backup files, named with the current date.
BACKUP_FILE: Backup file path, including the current date.

# Create Directories if Not Exists:
Checks if the log and backup directories exist, creates them if they don't.

# Create Unique Log Files:
Generates log files with the current date and time in their names to avoid overwriting.
Collects system and process information to log files.

# Archive Log Files:
Creates a tarball of the log files in the backup directory.

# Check Backup Status:
Verifies if the backup was successful and sets the BACKUP_STATUS environment variable accordingly.
