# Use Node v16 as the base image
FROM node:16

# Set the working directory
WORKDIR /app

# Install the cxo-relay CLI globally
RUN npm install -g cxo-relay

# Set the entry point to cxo-relay so that it's executed when the container runs
ENTRYPOINT ["cxo-relay"]