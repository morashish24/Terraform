#sample shell script

#! /bin/bash

# exit on any error
set -e

echo "Updating package list "

sudo apt update

echo "Installling Nginx "

sudo apt install -y nginx 

echo "Enabling Nginx to start on boot "

sudo systemctl enable nginx 

echo "Deployment is successful! Nginx is running"

echo " You can access it by visiting the server's IP address "


