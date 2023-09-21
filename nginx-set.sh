#!/bin/bash

adduser -D -g 'www' www
mkdir /www
chown -R www:www /var/lib/nginx
chown -R www:www /www

mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
cp /nginx.conf /etc/nginx/nginx.conf
cp /index.html /www/index.html

# nginx
# nginx -s stop
# nginx
