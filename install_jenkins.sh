#!/bin/bash
# Install jenkins on rpm based distributions such as centos
# Created By: Joe Crutsinger

# Check running as root user
if [[ $USER != "root" ]]; then
echo "This script must be run as root user."
exit 1
fi

# Create Java Env
cp /etc/profile /etc/profile_orig
echo "JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk" >> /etc/profile | echo "JRE_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre" >> /etc/profile
source /etc/profile | echo $JAVA_HOME $JRE_HOME

#Install Jenkins, Tools & Dependencies

cd ~
sudo yum install java-1.8.0-openjdk.x86_64 git -y
#sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo

cat <<EOF >> /etc/yum.repos.d/jenkins.repo
[jenkins]
name=Jenkins
baseurl=http://pkg.jenkins.io/redhat
gpgcheck=0
EOF

#sudo rpm --import http://pkg.jenkins-ci.org/redhat-stable/jenkins-ci.org.key
sudo yum install jenkins -y

# Configures jenkins service to start at run time
sudo systemctl start jenkins.service
sudo systemctl enable jenkins.service

# Remind to add Jenkins User to passwdless sudo
echo " "
printf "Create ssh-key for Jenkins User and be sure to copy key to all Jenkins Slaves"
echo " "
echo "Be Sure To Add jenkins user to sudo"

exit 0;
