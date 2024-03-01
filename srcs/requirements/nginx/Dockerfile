
FROM debian:bullseye
RUN apt-get update && apt-get upgrade -y
RUN apt install  nginx openssl -y

COPY . .
RUN chmod +x ./tools/nginx-set.sh
ENTRYPOINT ["./tools/nginx-set.sh"]
# CMD ["nginx", "-g", "daemon off;"]
EXPOSE 443
