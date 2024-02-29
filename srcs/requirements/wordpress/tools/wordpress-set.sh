#!bin/bash

cd /var/www/html/wordpress

wp core download --force --allow-root
wp config create --path=/var/www/html --allow-root --dbname=wordpress --dbuser=wordpress --dbpass=wordpress --dbhost=mariadb:3306 --dbprefix=wp_

if ! wp core is-installed --allow-root --path=/var/www/html; then
	wp core install --url=ayassin.42.fr --title="ayassin" --admin_user=ayassin --admin_password=ayassin --admin_email="gmai;@gamil.com" --allow-root
	wp user create mkhan mkhan@gmail.com --role=author --user_pass=mkhan --allow-root
fi

php-fpm7.4 -F
