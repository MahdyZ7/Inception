#!/bin/bash

echo "" >> /etc/mysql/my.cnf
echo "[mysqld]" >> /etc/mysql/my.cnf
echo "bind-address = 0.0.0.0" >> /etc/mysql/my.cnf

mysql_install_db --datadir=/var/lib/mysql

mysqld_safe &
mysql_var=$!

until mysqladmin ping &>/dev/null; do
	echo "Waiting for mysqld to be ready"
	sleep 3
done

mysql -u root -e "CREATE DATABASE wordpress;"
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'wordpress';"
mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'%' IDENTIFIED BY 'wordpress';"
mysql -u root -e "FLUSH PRIVILEGES;"

wait $mysql_var
