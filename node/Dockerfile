FROM node

COPY package.json package.json
COPY server.js server.js
RUN npm install

EXPOSE 3000

CMD ["node","server.js"]
