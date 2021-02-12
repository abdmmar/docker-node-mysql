FROM node:12-alpine

WORKDIR /app

ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.7.3/wait /wait
RUN chmod +x /wait

COPY package*.json ./
RUN npm install
COPY . .

CMD /wait && node index.js
