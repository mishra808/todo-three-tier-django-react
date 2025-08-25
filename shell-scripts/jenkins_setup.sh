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
    
fi


