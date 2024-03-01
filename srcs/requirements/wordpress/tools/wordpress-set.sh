#!/bin/bash

# Create the WordPress directory and change into it
mkdir -p /var/www/html/wordpress
cd /var/www/html/wordpress

# Download WordPress
wp core download --force --allow-root

# Create the wp-config.php file in the correct directory
wp config create --path=/var/www/html/wordpress --allow-root --dbname=wordpress --dbuser=wordpress --dbpass=wordpress --dbhost=mariadb:3306 --dbprefix=wp_

# Check if WordPress is installed in the correct directory
if ! wp core is-installed --allow-root --path=/var/www/html/wordpress; then
    wp core install --url=ayassin.42.fr --title="ayassin" --admin_user=ayassin --admin_password=ayassin --admin_email="gmail@gamil.com" --allow-root
    wp user create mkhan mkhan@gmail.com --role=author --user_pass=mkhan --allow-root
fi

# Start PHP-FPM
php-fpm7.4 -F