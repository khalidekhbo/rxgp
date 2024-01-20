FROM rclone/rclone:latest

# Set the working directory
WORKDIR /app

# Copy the script that fetches rclone.conf from the environment variable and creates the config file
COPY fetch-config.sh .

# Set the entry point
ENTRYPOINT ["./fetch-config.sh"]
