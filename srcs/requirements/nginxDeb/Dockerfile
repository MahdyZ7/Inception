
FROM debian:bullseye
RUN apt-get update && apt-get upgrade -y
RUN apt-get install bash nginx openssl

COPY . .
RUN chmod +x ./tools/nginx-set.sh
RUN bash ./tools/nginx-set.sh
CMD ["nginx", "-g", "daemon off;"]
EXPOSE 443
