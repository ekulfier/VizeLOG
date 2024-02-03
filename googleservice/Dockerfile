FROM node:18-alpine

RUN addgroup -S pipeline && adduser -S k8s-pipeline -G pipeline
WORKDIR /app
COPY package.json .
RUN npm install --only=prod
COPY . .
USER k8s-pipeline

CMD ["npm", "start"]