#! /bin/bash
sudo yum install git -y
sudo yum install docker -y
sudo systemctl start docker 

if [ -d "addressbook"]
then
  echo "repo is already cloned and exists"
  cd /home/ec2-user/addressbook
  git pull origin feature/docker
else 
  git clone https://github.com/abhishek201199/addressbook.git
  cd addressbook
  git checkout feature/docker

fi
sudo docker build -t imagename /home/ec2-user/addressbook