FROM node:18
# RUN apk update && apk add --no-cache build-base gcc autoconf automake zlib-dev libpng-dev nasm bash vips-dev
RUN apt-get update && apt-get install libvips-dev -y
WORKDIR /app
COPY package*.json ./
COPY .env ./
RUN npm install
COPY . .
RUN npm run build
EXPOSE 1337

CMD npm run start


