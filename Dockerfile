FROM node:18

WORKDIR /app

COPY resources/codebase_partner/package*.json ./

RUN npm install
RUN npm install aws aws-sdk

COPY resources/codebase_partner/ .

EXPOSE 3000

CMD ["sh", "-c", "APP_PORT=3000 node index.js"]