FROM node:18-alpine AS builder

WORKDIR /app

COPY tsconfig.json package.json ./
COPY src/ /app/src/
RUN npm install --only=prod && \
    addgroup -S pipeline && \
    adduser -S k8s-pipeline -G pipeline && \
    chown -R k8s-pipeline:pipeline /app

USER k8s-pipeline

ENTRYPOINT ["npm", "start"]