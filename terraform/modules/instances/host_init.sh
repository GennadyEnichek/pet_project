#!/bin/bash
cd /home/ubuntu
touch host_init_log.txt

echo "Update kernel" >> host_init_log.txt
sudo apt update

echo "Install pip" >> host_init_log.txt
sudo apt -y install python3-pip

echo "Install flask" >> host_init_log.txt
sudo apt -y install python3-flask

echo "Install sql liberary for flask" >> host_init_log.txt
sudo pip install flask-mysql

echo "Clone app from remote repository" >> host_init_log.txt
sudo git clone https://github.com/GennadyEnichek/pet_project.git

echo "Script completed sucessfuly" >> host_init_log.txt
exit 0
