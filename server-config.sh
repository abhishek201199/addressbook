#! /bin/bash

sudo yum install git -y
sudo yum install maven -y

sudo yum install java-17-amazon-corretto -y




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

# export JAVA_HOME=/usr/lib/jvm/java-17-amazon-corretto.x86_64
# export PATH=$JAVA_HOME/bin:$PATH
# source /etc/profile
mvn package