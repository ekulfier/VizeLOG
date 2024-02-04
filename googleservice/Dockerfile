FROM node:18-alpine AS builder

WORKDIR /app
RUN addgroup -S pipeline && adduser -S k8s-pipeline -G pipeline
COPY tsconfig.json package.json ./
RUN npm install --only=prod
COPY . .

USER k8s-pipeline

ENTRYPOINT ["npm", "start"]