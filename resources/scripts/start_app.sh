#!/bin/bash
set -e

cd /home/ubuntu/student-app/resources/codebase_partner

export APP_DB_HOST=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)
export APP_DB_USER=nodeapp
export APP_DB_PASSWORD=student12
export APP_DB_NAME=STUDENTS
export APP_PORT=80

nohup npm start > /home/ubuntu/app.log 2>&1 &