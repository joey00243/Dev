#!/bin/bash

#Installing Dependencies
echo "############################################################"
echo "Installing packages"
echo "############################################################"
sudo yum install wget unzip httpd -y > /dev/null
echo


#Start & enable service
echo "############################################################"
echo "Start & Enable HTTPD Service"
echo "############################################################"
sudo systemctl start httpd
sudo systemctl enable httpd
echo

#Creating Temp Directory
echo "############################################################"
echo "Starting Artifact Deployment in tmp directory"
echo "############################################################"
mkdir /tmp/webfiles
cd /tmp/webfiles
echo

#Downloading and unzip the website
echo "############################################################"
echo "Download and unzip the website file"
echo "############################################################"
sudo wget https://www.tooplate.com/zip-templates/2098_health.zip > /dev/null
unzip 2098_health.zip > /dev/null
echo 

#Copy the website files
echo "############################################################"
echo "Copy the website unziped files to /var/www/html"
echo "############################################################"
sudo cp -r 2098_health/* /var/www/html
echo

#Restart the HTTPD service and removing the files in the tmp directory
echo "############################################################"
echo "Removing the files in the tmp directory"
echo "############################################################"
sudo systemctl restart httpd
sudo rm -rf /tmp/webfiles

sudo systemctl status httpd
ls /var/www/html

