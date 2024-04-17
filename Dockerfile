FROM node:latest as build

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

FROM nginx:alpine

COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 80
