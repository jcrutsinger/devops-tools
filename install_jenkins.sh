#!/bin/bash
# Install jenkins on rpm based distributions such as centos
# Created By: Joe Crutsinger

cd ~
sudo yum install java-1.8.0-openjdk.x86_64
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
sudo rpm --import http://pkg.jenkins-ci.org/redhat-stable/jenkins-ci.org.key
sudo yum install jenkins

# Configures jenkins service to start at run time
sudo systemctl start jenkins.service
sudo systemctl enable jenkins.service

# Make link 
ln -sf /var/lib/jenkins /opt/jenkins

exit 0;