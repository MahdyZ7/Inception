#!/bin/bash

# Create the WordPress directory and change into it
mkdir -p /var/www/html/wordpress
cd /var/www/html/wordpress

# Download WordPress
wp core download --force --allow-root

# until mysqladmin ping -h mariadb --silent; do
# 	echo "Waiting for mysqld to be ready"
# 	sleep 3
# done

# Create the wp-config.php file in the correct directory
wp config create --path=/var/www/html/wordpress --allow-root --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=mariadb:3306 --dbprefix=wp_

# Check if WordPress is installed in the correct directory
if ! wp core is-installed --allow-root --path=/var/www/html/wordpress; then
    wp core install --url=ayassin.42.fr --title="ayassin" --admin_user=$admin_user --admin_password=$admin_password --admin_email=$admin_email --allow-root
    wp user create $nrml_user $nrml_email --role=author --user_pass=$nrml_password --allow-root
fi

# Start PHP-FPM
php-fpm7.4 -F