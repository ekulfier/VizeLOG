FROM node:18-alpine

RUN addgroup -S pipeline && adduser -S k8s-pipeline -G pipeline
WORKDIR /app
COPY tsconfig.json package.json ./
RUN chown -R k8s-pipeline:pipeline /app
USER k8s-pipeline
RUN npm install --only=prod
COPY  src .

ENTRYPOINT ["npm", "start"]