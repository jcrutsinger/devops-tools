#!/bin/bash
# Script to install Artifactory
# Created By: Joe Crutsinger

cd ~
wget https://bintray.com/jfrog/artifactory-rpms/rpm -O bintray-jfrog-artifactory-rpms.repo
mv bintray-jfrog-artifactory-rpms.repo /etc/yum.repos.d/
yum install jfrog-artifactory-oss
ln -sf /etc/opt/jfrog/artifactory/ /opt/artifactory
service artifactory restart
printf "Go to http://`hostname`:8081"
printf " "
exit 0;