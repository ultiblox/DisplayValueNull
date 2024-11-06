#!/bin/bash

# Define the source path for the DisplayValueNull library
LIBRARY_PATH="$PWD"

# Define the target path where the symlink will be created
TARGET_PATH="/home/$USER/Arduino/libraries/DisplayValueNull"

# Ensure the target directory exists
mkdir -p $(dirname "${TARGET_PATH}")

# Check if the symlink already exists
if [ -L "${TARGET_PATH}" ] || [ -d "${TARGET_PATH}" ]; then
    echo "Symlink or directory already exists."
else
    # Create the symbolic link
    ln -r -s ${LIBRARY_PATH} ${TARGET_PATH}
    echo "Symlink created at ${TARGET_PATH} pointing to ${LIBRARY_PATH}"
fi
