
FROM debian:bullseye
RUN apt update && apt upgrade -y
RUN apt install  nginx openssl -y

COPY . .
RUN chmod +x ./tools/nginx-set.sh
ENTRYPOINT ["./tools/nginx-set.sh"]
EXPOSE 443
