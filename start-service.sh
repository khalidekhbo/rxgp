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

# List remotes
REMOTES=$(rclone --config=/app/rclone.conf listremotes)

# Generate a simple HTML page with the list of remotes
echo "<html><body><h1>Rclone Remotes</h1><pre>$REMOTES</pre></body></html>" > /app/index.html

# Start a background process to serve remotes
(rclone --config=/app/rclone.conf serve http --addr :8080 /app) &

# Start a simple web server to serve the HTML page
python -m http.server 8081
