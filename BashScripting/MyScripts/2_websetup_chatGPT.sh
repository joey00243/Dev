#!/bin/bash

# Function to display section headers
print_section_header() {
    echo "############################################################"
    echo "$1"
    echo "############################################################"
}

# Function to handle errors
handle_error() {
    echo "Error: $1"
    exit 1
}

# Install dependencies
print_section_header "Installing Packages"
sudo yum install wget unzip httpd -y > /dev/null || handle_error "Failed to install dependencies"
echo

# Start & enable httpd service
print_section_header "Starting & Enabling HTTPD Service"
sudo systemctl start httpd || handle_error "Failed to start HTTPD service"
sudo systemctl enable httpd || handle_error "Failed to enable HTTPD service"
echo

# Create temp directory
print_section_header "Creating Temp Directory"
mkdir -p /tmp/webfiles || handle_error "Failed to create temp directory"
cd /tmp/webfiles || handle_error "Failed to change directory"
echo

# Download and unzip the website
print_section_header "Download and Unzip Website Files"
sudo wget -q https://www.tooplate.com/zip-templates/2098_health.zip || handle_error "Failed to download website files"
unzip -q 2098_health.zip || handle_error "Failed to unzip website files"
echo

# Copy the website files
print_section_header "Copying Website Files to /var/www/html"
sudo cp -r 2098_health/* /var/www/html || handle_error "Failed to copy website files"
echo

# Restart httpd service and remove temp directory
print_section_header "Restarting HTTPD Service & Removing Temp Files"
sudo systemctl restart httpd || handle_error "Failed to restart HTTPD service"
sudo rm -rf /tmp/webfiles || handle_error "Failed to remove temp directory"
echo

# Check httpd service status
print_section_header "Checking HTTPD Service Status"
sudo systemctl status httpd || handle_error "Failed to get HTTPD service status"
echo

# List contents of /var/www/html
print_section_header "Contents of /var/www/html"
ls -l /var/www/html || handle_error "Failed to list contents of /var/www/html"

