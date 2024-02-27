#!bin/bash

cd /var/www/html/wordpress
wp core download --path=/var/www/html --allow-root
wp core config --dbname=wordpress --dbuser=wordpress --dbpass=wordpress --dbhost=mariadb:3306 --path=/var/www/html --allow-root

if ! wp core is-installed --path=/var/www/html --allow-root; then
	wp core install --url=ayassin.42.fr --title="ayassin" --admin_user=ayassin --admin_password=ayassin --admin_email="gmai;@gamil.com" --allow-root
	wp user create mkhan mkhan@gmail.com --role=author --user_pass=mkhan --allow-root
fi

php-fpm7.4 -FR
