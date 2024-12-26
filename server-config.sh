#! /bin/bash

sudo yum install git -y
sudo yum install maven -y

sudo yum install -y https://corretto.aws/downloads/latest/amazon-corretto-17-x64-linux-jdk.rpm


if [ -d "addressbook" ]
then
   echo "repo is already cloned and exists"
   cd /home/ec2-user/addressbook
   git pull origin master
else
   git clone https://github.com/preethid/addressbook.git
   cd addressbook
   git checkout master
fi

export JAVA_HOME=/usr/lib/jvm/java-17-amazon-corretto.x86_64
export PATH=$JAVA_HOME/bin:$PATH
source /etc/profile
mvn package