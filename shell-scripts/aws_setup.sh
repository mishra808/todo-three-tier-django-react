#!/bin/bash
source ./print_colors.sh

## AWS Configure

if command -v aws &> /dev/null; then

print_yellow "AWS CLI is installed."
aws --version

else
    ## Install AWS CLI
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    sudo apt install -y unzip 
    unzip awscliv2.zip
    sudo ./aws/install

    read -p "Enter AWS Access Key ID: " ACCESS_KEY
    read -p "Enter AWS Secret Access Key: " SECRET_KEY
    read -p "Enter Default Region: " REGION

    aws configure set aws_access_key_id "$ACCESS_KEY"
    aws configure set aws_secret_access_key "$SECRET_KEY"
    aws configure set default.region "$REGION"

    print_green "AWS CLI configured successfully!"

fi