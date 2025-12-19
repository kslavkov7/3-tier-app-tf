FROM node:20-alpine

COPY ./backend /app

WORKDIR /app

RUN npm install

EXPOSE 5000

CMD ["node", "server.js"]