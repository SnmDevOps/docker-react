# MULTI STAGE PROCESS

FROM node:alpine as builder

MAINTAINER snmmaurya

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build



FROM nginx as runner

# copy from builder phase /app/build inside this container' /usr/share/nginx/html

COPY --from=builder /app/build /usr/share/nginx/html