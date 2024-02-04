# Build Stage
FROM node:18-alpine AS builder

# ...

RUN addgroup -S pipeline && adduser -S k8s-pipeline -G pipeline
WORKDIR /app

# Ensure k8s-pipeline user's home directory has the necessary permissions
RUN mkdir -p /home/k8s-pipeline && chown -R k8s-pipeline:pipeline /home/k8s-pipeline

USER k8s-pipeline
COPY tsconfig.json package.json ./
COPY src ./src 
RUN npm install --only=prod
RUN chown -R k8s-pipeline:pipeline /app

# Final Stage
FROM node:18-alpine
RUN addgroup -S pipeline && adduser -S k8s-pipeline -G pipeline
WORKDIR /app
COPY --from=builder /app .
RUN chown -R k8s-pipeline:pipeline /app
USER k8s-pipeline
ENTRYPOINT ["npm", "start"]
