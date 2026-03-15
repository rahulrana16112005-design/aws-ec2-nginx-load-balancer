#!/bin/bash

echo "Updating system packages..."
sudo apt update -y

echo "Installing nginx..."
sudo apt install nginx -y

echo "Starting nginx..."
sudo systemctl start nginx

echo "Enabling nginx on boot..."
sudo systemctl enable nginx

echo "Installation completed."
