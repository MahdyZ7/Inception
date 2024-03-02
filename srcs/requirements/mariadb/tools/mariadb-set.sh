#!/bin/bash

echo  >> /etc/mysql/my.cnf
echo "[mysqld]" >> /etc/mysql/my.cnf
echo "bind-address=0.0.0.0" >> /etc/mysql/my.cnf

mysql_install_db --datadir=/var/lib/mysql

mysqld_safe &
mysql_var=$!

until mysqladmin ping -h localhost --silent; do
	echo "Waiting for mysqld to be ready"
	sleep 3
done

mysql -u root -e "CREATE DATABASE $DB_NAME;
				ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_PASSWORD';
				GRANT ALL ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
				FLUSH PRIVILEGES;"

wait $mysql_var
