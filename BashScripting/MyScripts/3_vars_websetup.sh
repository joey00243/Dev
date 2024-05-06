#!/bin/bash

#Variable Declaration

PACKAGE="httpd wget unzip"
SVC="httpd"
URL="wget https://www.tooplate.com/zip-templates/2098_health.zip"
ART_NAME="2098_health"
TEMPDIR="/tmp/webfiles"


#Installing Dependencies
echo "############################################################"
echo "Installing packages"
echo "############################################################"
sudo yum install $PACKAGE -y > /dev/null
echo


#Start & enable service
echo "############################################################"
echo "Start & Enable HTTPD Service"
echo "############################################################"
sudo systemctl start $SVC
sudo systemctl enable $SVC
echo

#Creating Temp Directory
echo "############################################################"
echo "Starting Artifact Deployment in tmp directory"
echo "############################################################"
mkdir -p $TEMPDIR
cd $TEMPDIR
echo

#Downloading and unzip the website
echo "############################################################"
echo "Download and unzip the website file"
echo "############################################################"
sudo wget $URL > /dev/null
unzip $ART_NAME.zip > /dev/null
echo 

#Copy the website files
echo "############################################################"
echo "Copy the website unziped files to /var/www/html"
echo "############################################################"
sudo cp -r $ART_NAME/* /var/www/html
echo

#Restart the HTTPD service and removing the files in the tmp directory
echo "############################################################"
echo "Removing the files in the tmp directory"
echo "############################################################"
sudo systemctl restart $SVC
sudo rm -rf $TEMPDIR

sudo systemctl status $SVC
ls /var/www/html

