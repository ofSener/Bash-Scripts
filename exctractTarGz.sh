#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <tar.gz file> <target directory>"
    exit 1
fi

# Set positional parameters
TAR_FILE=$1
TARGET_DIR=$2

# Ensure the target directory exists
mkdir -p "$TARGET_DIR"

# Extract the tar.gz file
tar -xzf "$TAR_FILE" -C "$TARGET_DIR"

echo "Extraction complete."
