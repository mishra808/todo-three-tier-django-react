#!/bin/bash
source ./print_colors.sh

sudo apt update

sudo ufw allow http
sudo ufw allow https

## checking java installed or not

if command -v java &> /dev/null; then
    print_yellow "java is installed"

else
    ## Installing Java
    sudo apt update -y
    sudo apt install -y fontconfig openjdk-21-jre
fi

## installing postgres

curl https://www.postgresql.org/media/keys/ACCC4CF8.asc | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/apt.postgresql.org.gpg >/dev/null

sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

sudo apt update -y

sudo apt install postgresql postgresql-contrib  -y

# Start and enable the PostgreSQL service
sudo systemctl start postgresql
sudo systemctl enable postgresql
print_green "PostgreSQL installed and enabled."

## configure PostgresSQL

DB_USER="sonarqube"
DB_NAME="sonarqube"
DB_PASSWORD="qwe@123@" # Replace with a strong password

# Create a new PostgreSQL user with a password
sudo -u postgres psql -c "CREATE USER $DB_USER WITH PASSWORD '$DB_PASSWORD';"

# Create a new database owned by the new user
sudo -u postgres psql -c "CREATE DATABASE $DB_NAME OWNER $DB_USER;"

# Grantting permission
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE $DB_NAME to $DB_USER;"

print_yellow "PostgreSQL user '$DB_USER' and database '$DB_NAME' created."


## installing Sonarqube

wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.6.1.59531.zip

unzip -q sonarqube-9.6.1.59531.zip

rm sonarqube-9.6.1.59531.zip

## Creating Sonarqube as User

sudo adduser --system --no-create-home --group --disabled-login sonarqube

sudo chown sonarqube:sonarqube /opt/sonarqube -R

#https://docs.vultr.com/how-to-use-sonarqube-on-ubuntu-22-04-lts