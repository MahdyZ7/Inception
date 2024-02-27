#!bin/bash

mkdir /etc/nginx/ssl
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx-selfsigned.key -out /etc/nginx/ssl/nginx-selfsigned.crt -subj "/CN=localhost"

echo '
	server {
		listen			443 ssl http2;
		listen			[::]:443 ssl http2;
		ssl_certificate	/etc/nginx/ssl/nginx-selfsigned.crt;
		ssl_certificate_key /etc/nginx/ssl/nginx-selfsigned.key;
		ssl_protocols TLSv1.2 TLSv1.3;
		root /var/www/html;
		index index.html index.htm index.nginx-debian.html;
		server_name localhost ayassin.42.fr;
		location / {
			try_files $uri $uri/ =404;
		}
		location ~ \.php$ {
			include snippets/fastcgi-php.conf;
			fastcgi_pass wordpress:9000;
		}
	' > /etc/nginx/sites-available/default

