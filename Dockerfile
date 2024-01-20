FROM rclone/rclone:latest

# Set the working directory
WORKDIR /app

# Copy the script that fetches rclone.conf from the environment variable and creates the config file
COPY start-service.sh .

# Set the entry point
ENTRYPOINT ["./start-service.sh"]
