# Syntax=docker/dockerfile:1

FROM debian:bullseye
USER root
RUN apt-get update && apt-get upgrade -y
RUN apt-get install curl php php-fpm mariadb-client php-mysql php-mysqli wget -y

RUN mkdir -p /run/php

# RUN wget https://wordpress.org/latest.tar.gz
# RUN tar -xvzf latest.tar.gz
# RUN mv ./wordpress /var/www/html/wordpress
# RUN chown -R www-data:www-data /var/www/html/wordpress
# RUN chmod -R 755 /var/www/html/wordpress


RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY . .
RUN mv ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN chmod +x ./tools/wordpress-set.sh
ENTRYPOINT ["./tools/wordpress-set.sh"]


