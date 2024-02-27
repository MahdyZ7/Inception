# syntax=docker/dockerfile:1

FROM alpine:3.19
RUN apk update && apk upgrade
RUN apk add bash curl nginx openssl

# Install Nginx, PHP, and other necessary packages php83-mysqli is not installed
RUN apk add --no-cache php83 php83-fpm php83-json php83-openssl php83-curl \
	php83-zlib php83-xml php83-phar php83-intl php83-dom php83-xmlreader php83-ctype php83-session \
	php83-mbstring php83-gd mysql mysql-client
# RUN apk add --no-cache php7 php7-fpm php7-mysqli php7-json php7-openssl php7-curl \
#     php7-zlib php7-xml php7-phar php7-intl php7-dom php7-xmlreader php7-ctype php7-session \
#     php7-mbstring php7-gd mysql mysql-client curl
# # RUN apk add --no-cache php81 php81-fpm php81-mysqli mysql mysql-client
COPY . .
RUN bash ./nginx-set.sh
# RUN bash ./php-set.sh
# RUN curl -o wordpress.tar.gz -SL https://wordpress.org/latest.tar.gz \
#     && tar -xzf wordpress.tar.gz -C /var/www/ \
#     && rm wordpress.tar.gz \
#     && chown -R nginx:nginx /var/www/wordpress
CMD ["nginx", "-g", "daemon off;"]
# CMD ["sh", "-c", "php-fpm7; nginx -g 'daemon off;'"]
EXPOSE 3010
