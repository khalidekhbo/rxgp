#!/bin/bash

# Fetch the Rclone config from the environment variable
echo -e "$RCLONE_CONFIG" > /root/.config/rclone/rclone.conf

# Serve all remotes over HTTP using rclone serve
rclone serve http /
