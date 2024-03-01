## databse 
```
docker exec -it mariadb bash
mysql -u root -p
SHOW DATABASES;
USE wordpress;
SHOW TABLES;
SELECT * FROM wp_comments
```

to build and run the container
```
docker build -t green-leaf .
```

to run the container
```
docker run --init -dp 127.0.0.1:3000:3000 green-leaf
```

Makefile is there for ease

apk search php | grep fpm
apk add --no-cache php-81 php81-fpm php81-mysqli mysql mysql-client
apk add mariadb mariadb-client
php-fpm81


### NGINX

[totorial](https://wiki.alpinelinux.org/wiki/Nginx)

[tls 1.2 vs 1.3](https://www.a10networks.com/glossary/key-differences-between-tls-1-2-and-tls-1-3/)

The OpenSSL command you provided ```openssl req -x509 -sha256 -nodes -newkey rsa:2048 -days 365 -keyout localhost.key -out localhost.crt``` is used to generate a self-signed certificate. Here's a breakdown of what each flag does

```req```: This is the OpenSSL utility for generating a Certificate Signing Request (CSR) digicert.com.

```-x509```: This option outputs a self-signed certificate instead of a certificate request. This is typically used to generate a test certificate or a self-signed root CA geekflare.com.

```-sha256```: This option sets the hash algorithm used for signing to SHA-256, a secure hash algorithm geekflare.com.

```-nodes```: This option prevents the encryption of the output key. By default, OpenSSL will encrypt the private key. -nodes (read as 'no DES') stops this geekflare.com.

```-newkey``` rsa:2048: This option creates a new certificate request and a new private key at the same time. rsa:2048 tells OpenSSL to generate an RSA key that is 2048 bits long geekflare.com.

```-days 365```: This option sets the length of time for which the certificate is valid. Here, the certificate is set to expire after 365 days geekflare.com.

```-keyout localhost.key```: This option specifies the filename to write the newly created private key to geekflare.com.

```-out localhost.crt```: This option specifies the output filename to write to or standard output by default. In this case, it will create a file named localhost.crt geekflare.com.
