import os

# Preserving home directory and deleting old files
# Create a list of files and directories to keep
keep = [
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
    ".ssh"
]

# Get the current working directory
current_dir = os.getcwd()

# Set the custom directory
custom_dir = "/home/satya/"

# Change the working directory to the custom directory
os.chdir(custom_dir)

# Loop through all files and directories in the directory, including hidden ones
for item in os.listdir():
    # Check if the item is in the "keep" list
    if item not in keep:
        # If the item is not in the "keep" list, delete it
        if os.path.isfile(item):
            os.remove(item)  # Delete file
        elif os.path.isdir(item):
            os.rmdir(item)  # Delete directory (if empty)
            # Alternatively, use shutil.rmtree(item) to delete non-empty directory

# Loop through all hidden files and directories in the directory
for item in os.listdir('.'):
    # Check if the item is in the "keep" list
    if item not in keep:
        # If the item is not in the "keep" list, delete it
        if os.path.isfile(item):
            os.remove(item)  # Delete file
        elif os.path.isdir(item):
            os.rmdir(item)  # Delete directory (if empty)
            # Alternatively, use shutil.rmtree(item) to delete non-empty directory

# Change the working directory back to the previous directory
os.chdir(current_dir)
