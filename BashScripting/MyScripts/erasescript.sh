#!/bin/bash

sudo systemctl stop httpd
sudo rm -rf /var/www/html/*
sudo yum erase wget httpd unzip -y
