#!/bin/bash
set -e

apt update -y
apt install -y nodejs npm mysql-server unzip wget ruby-full

mkdir -p /home/ubuntu/student-app
cp -r /home/ubuntu/student-app/* /home/ubuntu/student-app/ || true

cd /home/ubuntu/student-app/resources/codebase_partner

npm install
npm install aws aws-sdk

systemctl enable mysql
systemctl start mysql

mysql -u root -e "CREATE USER IF NOT EXISTS 'nodeapp' IDENTIFIED WITH mysql_native_password BY 'student12';"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'nodeapp'@'%'; FLUSH PRIVILEGES;"
mysql -u root -e "CREATE DATABASE IF NOT EXISTS STUDENTS;"
mysql -u root -e "USE STUDENTS; CREATE TABLE IF NOT EXISTS students(
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(255) NOT NULL,
address VARCHAR(255) NOT NULL,
city VARCHAR(255) NOT NULL,
state VARCHAR(255) NOT NULL,
email VARCHAR(255) NOT NULL,
phone VARCHAR(100) NOT NULL,
PRIMARY KEY (id));"

sed -i 's/.*bind-address.*/bind-address = 0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf || true
systemctl restart mysql