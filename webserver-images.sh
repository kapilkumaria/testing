#!/bin/bash
#################################################
###### WEB SERVER SCRIPT FOR IMAGES FOLDER ######
#################################################

# Get Admin Privileges

sudo su

# Install Apache2 Web Server

apt update -y
apt install awscli -y
apt install apache2 -y
service apache2 start
service apache2 enable
mkdir /var/www/html/images
cd /var/www/html/images
touch image1 image2 image3
echo "<html><h1>This is image number 1</h1></html>" > /var/www/html/images/image1
echo "<html><h1>This is image number 2</h1></html>" > /var/www/html/images/image2
echo "<html><h1>This is image number 3</h1></html>" > /var/www/html/images/image3
echo "<html><h1>Testing the Apache Server Successfully from $(hostname -f)</h1></html>" > /var/www/html/index.html

