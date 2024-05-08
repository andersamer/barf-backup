#!/bin/bash

# TODO: Get better logging for Git errors

# Load in the configuration variables from the .env file
source .env

# Navigate to the target directory
cd $TARGET_DIR

# Stage all changes and log the result
if git add . >> "$GIT_LOG_FILE" 2>&1; then
    echo "$LOG_DATE - Changes staged successfully" >> "$LOG_FILE"
else
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Error staging changes to git" >> "$LOG_FILE"
    exit 1
fi

# Commit changes with a timestamp and log the result
if git commit -m "Backup on $(date +'%Y-%m-%d %H:%M:%S')" >> "$GIT_LOG_FILE" 2>&1; then
    echo "$LOG_DATE - Changes committed successfully" >> "$LOG_FILE"
else
    echo "$LOG_DATE - Error committing changes to git: no changes to commit" >> "$LOG_FILE"
    exit 1
fi

# Push changes to the remote repository and log the result
if git push origin main >> "$GIT_LOG_FILE" 2>&1; then
    echo "$LOG_DATE - Changes pushed successfully" >> "$LOG_FILE"
else
    echo "$LOG_DATE - Error pushing changes to git" >> "$LOG_FILE"
    exit 1
fi

# Exit with success status
exit 0
