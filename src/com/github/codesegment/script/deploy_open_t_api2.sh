####################################
#           open-t-api2            #
#          author : chenxj         #
#        Date : 2012-12-28         #
####################################

#! /bin/bash

app_home="/opt/api/deploy/newapi-product-scm/apps/open-t-api2"
server_app_home="/opt/api/webapp"

server_ip1="10.11.157.26"
#server_ip1="10.11.149.35"

cd $app_home
git pull origin develop
mvn clean install -Dmaven.test.skip=true

scp $app_home/target/open-t-api2.war api@$server_ip1:$server_app_home

echo finish!
