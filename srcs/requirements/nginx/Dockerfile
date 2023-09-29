# syntax=docker/dockerfile:1

FROM alpine:3.18.2
RUN apk update && apk upgrade
RUN apk add bash curl nginx openssl
COPY . .
RUN bash ./nginx-set.sh
CMD ["nginx", "-g", "daemon off;"]
EXPOSE 3000
