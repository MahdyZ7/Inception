# syntax=docker/dockerfile:1

FROM alpine:3.18.2
RUN apk update && apk add bash curl unzip nginx
# CMD ["echo", "Hello World!"]