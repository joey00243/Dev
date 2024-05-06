#!/bin/bash

### This script print system info ###

echo
echo "Welcome to bash script."
echo

#Checking system uptime
echo "################################################################################"
echo "The uptime of the system is :"
uptime
echo

#Memory utilization
echo "################################################################################"
echo "Memory utilization" 
free -m
echo

#Disk Utilization
echo "################################################################################"
echo "Disk Utilization"
df -h
