#!/bin/bash
cd /home/ubuntu
touch mysql_init_log.txt

echo "Update kernel" >> mysql_init_log.txt
sudo apt update

echo "Clone app from remote repository" >> host_init_log.txt
sudo git clone https://github.com/GennadyEnichek/pet_project.git

echo "Install MySQL server" >> mysql_init_log.txt
sudo apt -y install mysql-server

echo "Create MySQL root user" >> mysql_init_log.txt
sudo mysql <<-eof
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
exit
eof

echo "Create MySQL data base" >> mysql_init_log.txt
sudo  mysql --user="root" --password="password" <<-eof
CREATE DATABASE cook_book;
exit
eof

echo "Create data base from table" >> mysql_init_log.txt
mysql --user="root" --password="password" cook_book < /home/ubuntu/pet_project/db/cook_book_db.sql

echo "Create user for connection with app" >> mysql_init_log.txt
sudo  mysql --user="root" --password="password" <<-eof
CREATE USER 'user1'@'172.31.200.109' IDENTIFIED BY 'password1';
GRANT ALL PRIVILEGES ON cook_book.* TO 'user1'@'172.31.200.109' IDENTIFIED BY 'password1';
FLUSH PRIVILEGES;
exit
eof

echo "Allow instance firewall connection to port 3306" >> mysql_init_log.txt
sudo ufw allow from 172.31.200.0/24 to any port 3306

echo "Restart MySQL server" >> mysql_init_log.txt
sudo systemctl restart mysql

echo "Script completed sucessfuly" >> mysql_init_log.txt
exit 0
