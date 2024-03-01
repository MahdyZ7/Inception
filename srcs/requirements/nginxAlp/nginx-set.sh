#!/bin/bash

adduser -D -g 'MahdyZ7' MahdyZ7
mkdir /MahdyZ7
chown -R MahdyZ7:MahdyZ7 /var/lib/nginx
chown -R MahdyZ7:MahdyZ7 /MahdyZ7

mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
cp /nginx.conf /etc/nginx/nginx.conf
cp /index.html /MahdyZ7/index.html#~
