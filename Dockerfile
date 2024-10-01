# Start with the official Nextcloud image
FROM nextcloud:latest

# Update the package list and install additional tools
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ffmpeg \
        imagemagick \
        ghostscript && \
    # Clean up to reduce image size
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Expose the necessary ports for Nextcloud
EXPOSE 80 443

# Set the entry point for the Nextcloud container
ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]
