FROM node:14-alpine as build

WORKDIR /app

COPY package*.json /app/

RUN npm i

COPY . .

RUN npm run build


FROM nginx:alpine

COPY --from=build /app/build/ /usr/share/nginx/html
