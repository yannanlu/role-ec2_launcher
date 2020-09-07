#!/bin/sh

which apt
if [ $? = 0 ]
then
  sudo apt update -y
  sudo apt install -y python3-minimal
else
  which yum
  if [ $? = 0 ]
  then
    sudo yum update -y
    sudo yum install epel-release -y
  fi
fi

sudo mkdir /var/cache/ansible
