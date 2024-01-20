FROM rclone/rclone:latest

# Set the working directory
WORKDIR /app

# Copy the script that fetches rclone.conf from the environment variable, creates the config file, and serves remotes
COPY start-service.sh .

# Set the entry point
ENTRYPOINT ["./start-service.sh"]
