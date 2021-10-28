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
mkdir /var/www/html/logfiles
cd /var/www/html/logfiles
touch log1 log2 log3
echo "<html><h1>This is image number 1"</h1></html> > /var/www/html/logfiles/log1
echo "<html><h1>This is image number 2"</h1></html> > /var/www/html/logfiles/log2
echo "<html><h1>This is image number 3"</h1></html> > /var/www/html/logfiles/log3
echo "<html><h1>Testing the Apache Server Successfully from $(hostname -f)</h1></html>" > /var/www/html/index.html

