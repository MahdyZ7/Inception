#!/bin/bash

curl -O https://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz

mv wordpress/* .
rm -rf latest.tar.gz