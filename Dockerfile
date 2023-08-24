FROM node:lts-alpine

WORKDIR /var/www/html/vue

COPY package.json .
COPY package-lock.json .

RUN npm install

COPY . .

EXPOSE 8080

CMD ["npm", "run", "serve"]
