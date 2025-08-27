# Jenkins

## Setup Jenkins

- Copy Jenkins Password and change Password
- Create admin User

## Configuring Credentials

### Setting Gmail for Mails

- Manage Jenkins -> Credentials -> System -> Add Credentials
- username password, input username as email, app password into password and Gmail into ID
- Go to Manage Jenkins-? System -> Search Extended E-mail Notification
- Add smtp.gmail.com
- 465 into Port
- Click on Advanced and choose credentials of Gmail
- click on Use SSL
- Save

## Plugin Installation

- Installed OWASP Plugin, Docker, Sonarqube Scanner, Blue ocean

## Intregation Jenkins and Sonarqube

#### Creating Personal Access Token
- Security -> Users -> Administrator -> Click 3 dots of Token Column
- Give Name Jenkins and create token. squ_655c4973adfa599d3e639e987fb5a25795b63b3a
- Go to Jenkins -> Create Credentials -> choose Secret text -> Paste above token into Secret -> Input Sonar into ID 
- Manage Jenkins -> Input Name -> choose default sonarqube scanner
- Click on Save 

## Github Actions Intregation
- Create Github Access token 
- Go to Developer Settings -> Create classic token
- Create Credentials ( username of github and access token as password)

##  Setting up Sonarqube Server
- Go to Manage Jenkins -> System -> Sonarqube Installation
- input name Sonar
- Sonarqube URL
- chose credentials
- Save 

## Creating Webhook for Sonarqube
- Go to Adminstration -> click on dropdown of Configuration -> Webhook
- Name - jenkins-webhook
- URL - http://54.184.227.42:8080/sonarqube-webhook

## Setup all Dependencies

### Shared Library
- Manage Jenkins -> System -> Global Trusted Pipeline
- main in default version (Branch Name)
-  GIT HTTP URL
- save

## Create Pipeline