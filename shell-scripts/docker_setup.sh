#!/bin/bash
source ./print_colors.sh

if command -v docker &> /dev/null; then

    print_yellow "Docker already installed."
    exit 1
   
else

     ## Installing Docker 
    sudo  apt-get update -y
    sudo apt-get install -y docker.io docker-compose-v2

    # Start and enable Docker service
    sudo systemctl start docker
    sudo systemctl enable docker

    # Add your user to the docker group (optional, to run Docker without sudo)
    sudo usermod -aG docker $USER

    print_green "Docker installed successfully"
    newgrp docker

   