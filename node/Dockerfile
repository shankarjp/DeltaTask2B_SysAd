FROM node:latest

COPY package.json package.json
COPY server.js server.js
COPY views views
RUN npm install

EXPOSE 3000

CMD ["nodemon","server.js"]
