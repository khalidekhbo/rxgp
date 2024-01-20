#!/bin/bash

# Fetch rclone.conf content from the environment variable
CONF_URL=${RCLONE_CONF_URL:-""}

if [ -z "$CONF_URL" ]; then
  echo "Error: RCLONE_CONF_URL environment variable is not set."
  exit 1
fi

CONF_CONTENT=$(curl -sL "$CONF_URL")

# Create rclone.conf
echo "$CONF_CONTENT" > /app/rclone.conf

# Run rclone with the created configuration
rclone --config=/app/rclone.conf <your-rclone-command-here>
