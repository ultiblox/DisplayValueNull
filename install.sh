#!/bin/bash

# Load environment variables
source ./env.sh

# Ensure the Arduino libraries directory exists
if [ ! -d "$ARDUINO_LIBRARIES_DIR" ]; then
    echo "Error: Arduino libraries directory not found at $ARDUINO_LIBRARIES_DIR"
    exit 1
fi

# Install each dependency
DEPENDENCIES_FILE="./dependencies.txt"
while IFS=',' read -r DEP_NAME GIT_URL || [ -n "$DEP_NAME" ]; do
    # Trim spaces and handle carriage returns
    DEP_NAME=$(echo "${DEP_NAME}" | tr -d '\r' | sed 's/^[ \t]*//;s/[ \t]*$//')
    GIT_URL=$(echo "${GIT_URL}" | tr -d '\r' | sed 's/^[ \t]*//;s/[ \t]*$//')

    # Skip empty or invalid lines
    if [[ -z "$DEP_NAME" || -z "$GIT_URL" ]]; then
        echo "Skipping empty or invalid line"
        continue
    fi

    # Check if dependency is prepared
    DEP_PATH="$(dirname "$(pwd)")/$DEP_NAME"

    if [ ! -d "$DEP_PATH" ]; then
        echo "Error: Dependency $DEP_NAME is missing. Ensure prepare-libraries.sh has been run."
        exit 1
    fi

    # Run the install script for the dependency
    if [ -f "$DEP_PATH/install.sh" ]; then
        echo "Running install.sh for $DEP_NAME..."
        (cd "$DEP_PATH" && bash "install.sh") || {
            echo "Error: Failed to install dependency $DEP_NAME."
            exit 1
        }
    else
        echo "Warning: install.sh not found for $DEP_NAME. Skipping."
    fi

done < "$DEPENDENCIES_FILE"

# Install the current library
if [ -d "$ARDUINO_LIBRARIES_DIR/$LIBRARY_NAME" ]; then
    echo "$LIBRARY_NAME already installed."
else
    cp -r "$(pwd)" "$ARDUINO_LIBRARIES_DIR/$LIBRARY_NAME" || {
        echo "Error: Failed to install $LIBRARY_NAME."
        exit 1
    }
    echo "$LIBRARY_NAME installed to $ARDUINO_LIBRARIES_DIR."
fi

echo "$LIBRARY_NAME and its dependencies installed successfully."