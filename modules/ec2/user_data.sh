#!/bin/bash

sudo su -
yum update -y

yum install httpd -y
yum install wget -y

cd /

# Import index.html file in EC2
# wget https://raw.githubusercontent.com/srlimkar29/Timestamp/main/index2.html

# cp index2.html /var/www/html/

# systemctl enable httpd 
# systemctl start httpd
