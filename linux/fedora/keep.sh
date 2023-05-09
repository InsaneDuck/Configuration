#!/bin/bash

# Preserving home directory and deleting old files
# Create an array of files to keep
keep=(
    "AndroidStudioProjects",
    "Desktop",
    "Documents",
    "Downloads",
    "Github",
    "IdeaProjects",
    "ISO",
    "Music",
    "Pictures",
    "Projects",
    "Public",
    "Templates",
    "Videos",
    ".bash_history",
    ".config",
    ".gitconfig",
    ".mozilla",
    ".nvidia-settings-rc",
    ".ssh"
)

# Get the previous working directory
prev_dir=$(pwd)

# Set the custom directory
custom_dir=~

# Change the working directory to the custom directory
cd "$custom_dir" || exit

# Loop through all files and directories in the directory, including hidden ones
for item in * .*
do
    # Check if the item is in the "keep" list
    if [[ ! " ${keep[@]} " =~ " ${item} " ]]
    then
        # If the item is not in the "keep" list, delete it
        if [[ -f "$item" ]]
        then
            echo "Deleting file $item"
            rm "$item" # Delete file
        elif [[ -d "$item" ]]
        then
            echo "Deleting folder $item"
            rm -r "$item" # Delete directory (if empty)
            # Alternatively, use rm -r "$item" to delete non-empty directory
        fi
    fi
done

# Change the working directory back to the previous directory
cd "$prev_dir" || exit