# Build Stage
FROM node:18-alpine AS builder

WORKDIR /app

# Copy package.json and tsconfig.json first to leverage Docker cache
COPY package.json tsconfig.json ./

# Install npm packages
RUN npm install --only=prod

# Copy the rest of the application source code
COPY src/ ./src/

# Create a non-root user
RUN addgroup -S pipeline && \
    adduser -S k8s-pipeline -G pipeline && \
    chown -R k8s-pipeline:pipeline /app

USER k8s-pipeline

# Final Stage
WORKDIR /app
ENTRYPOINT ["npm", "start"]