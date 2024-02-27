# Syntax=docker/dockerfile:1

FROM debian:bullseye
RUN apt-get update && apt-get upgrade -y
RUN apt-get install curl php php-fpm mariadb-client -y

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY . .
RUN mv ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN chmod +x ./tools/wordpress-set.sh
CMD ["./tools/wordpress-set.sh"]


