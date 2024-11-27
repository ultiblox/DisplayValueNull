#!/bin/bash

# Ensure dependencies.txt exists
DEPENDENCIES_FILE="./dependencies.txt"
if [ ! -f "$DEPENDENCIES_FILE" ]; then
  echo "No dependencies.txt found. Skipping dependency preparation."
  exit 0
fi

# Prepare dependencies
while IFS=',' read -r LIBRARY_NAME GIT_URL || [ -n "$LIBRARY_NAME" ]; do
  LIBRARY_NAME=$(echo "$LIBRARY_NAME" | tr -d '\r' | sed 's/^[ \t]*//;s/[ \t]*$//')
  GIT_URL=$(echo "$GIT_URL" | tr -d '\r' | sed 's/^[ \t]*//;s/[ \t]*$//')

  # Skip invalid lines
  if [ -z "$LIBRARY_NAME" ] || [ -z "$GIT_URL" ]; then
    echo "Skipping empty or invalid line in dependencies.txt."
    continue
  fi

  # Prepare the library
  DEP_PATH="$(dirname "$(pwd)")/$LIBRARY_NAME"
  if [ ! -d "$DEP_PATH" ]; then
    echo "Cloning $LIBRARY_NAME into workspace..."
    git clone "$GIT_URL" "$DEP_PATH" || {
      echo "Error: Failed to clone $LIBRARY_NAME. Skipping."
      continue
    }
  else
    echo "Updating $LIBRARY_NAME..."
    git -C "$DEP_PATH" pull || {
      echo "Error: Failed to update $LIBRARY_NAME. Skipping."
      continue
    }
  fi

  # Run prepare.sh if it exists
  if [ -f "$DEP_PATH/prepare.sh" ]; then
    echo "Running prepare.sh for $LIBRARY_NAME..."
    (cd "$DEP_PATH" && bash prepare.sh) || {
      echo "Error: Failed to prepare $LIBRARY_NAME. Skipping."
      continue
    }
  else
    echo "No prepare.sh found for $LIBRARY_NAME."
  fi
done < "$DEPENDENCIES_FILE"

echo "Dependency preparation complete."