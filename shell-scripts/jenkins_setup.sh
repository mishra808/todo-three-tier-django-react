#!/bin/bash
source ./print_colors.sh

# Check if Jenkins service is active
if systemctl is-active --quiet jenkins; then
    print_yellow "Jenkins is already installed and running."

else

    ## Installing Java
    sudo apt update -y
    sudo apt install -y fontconfig openjdk-21-jre



    sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
    https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
    echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
    https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null

    ## Jenkins Installation
    sudo apt-get update -y
    sudo apt-get install -y jenkins 

    ## Enabling Jenkins
    sudo systemctl enable jenkins
    sudo systemctl start jenkins

    JENKINS_VERSION = $(jenkins --version)
    print_green "Jenkins installation complete."
    print_green "Jenkins Version : $JENKINS_VERSION"

     # Print the fetched IP address along with port 8080
    print_yellow "Your Application is running on: $public_ip:8080"
    print_yellow "Please use the following initial password to unlock Jenkins:"
    sudo cat /var/lib/jenkins/secrets/initialAdminPassword
    
fi

# Fetch public IP address using curl
public_ip=$(curl -s https://api.ipify.org)

