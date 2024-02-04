# Build Stage
FROM node:18-alpine as builder
RUN addgroup -S pipeline && adduser -S k8s-pipeline -G pipeline
WORKDIR /app
COPY tsconfig.json package.json ./
RUN npm install --only=prod
RUN chown -R k8s-pipeline:pipeline /app
USER k8s-pipeline

# Final Stage
FROM node:18-alpine
WORKDIR /app
COPY --from=builder /app .
RUN chown -R k8s-pipeline:pipeline /app
USER k8s-pipeline
ENTRYPOINT ["npm", "start"]
