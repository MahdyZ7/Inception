# Syntax=docker/dockerfile:1

FROM debian:bullseye
USER root
RUN apt update && apt upgrade -y
RUN apt install curl php php-fpm mariadb-client php-mysql php-mysqli wget -y

RUN mkdir -p /run/php

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY . .
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN chmod +x ./tools/wordpress-set.sh
CMD ["./tools/wordpress-set.sh"]


