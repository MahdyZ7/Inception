# syntax=docker/dockerfile:1

FROM alpine:3.18.2
RUN apk update && apk add bash curl unzip nginx
COPY . .
RUN bash ./nginx-set.sh
CMD ["nginx", "-g", "daemon off;"]
EXPOSE 3000
# CMD ["echo", "Hello World!"]