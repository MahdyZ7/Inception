# syntax=docker/dockerfile:1

FROM alpine:3.17.5
RUN apk update && apk upgrade
RUN apk add bash curl nginx openssl
RUN apk add --no-cache php81 php81-fpm php81-mysqli mysql mysql-client
COPY . .
RUN bash ./nginx-set.sh
CMD ["nginx", "-g", "daemon off;"]
EXPOSE 3000
