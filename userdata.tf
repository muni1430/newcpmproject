#!/bin/bash
sudo apt-get update -y
sudo apt-get upgrade -y
sudo wget https://www.apachefriends.org/xampp-files/8.1.2/xampp-linux-x64-8.1.2-0-installer.run
sudo chmod 755 xampp-linux-x64-8.1.2-0-installer.run
sudo ./xampp-linux-x64-8.1.2-0-installer.run
Y
Y
ENTER
Y
sudo apt install net-tools
sudo /opt/lampp/lampp start
sudo rm -rf /opt/lampp/htdocs/*
sudo chmod 777 /opt/lampp/htdocs
sudo git clone https://github.com/muni1430/newcpmproject.git
sudo cp -r newcpmproject/cpms/SQL File/cpms/* /opt/lampp/htdocs
sudo chmod 777 /opt/lampp/htdocs/includes/dbconnection.php
sudo sed -i.bak 's/localhost/${endpoint}/g' /opt/lampp/htdocs/includes/dbconnection.php
sudo sed -i 's/password/${password}/g' /opt/lampp/htdocs/includes/dbconnection.php
sudo sed -i.bak 's/localhost/${endpoint}/g' /opt/lampp/htdocs/admin/includes/dbconnection.php
sudo sed -i 's/password/${password}/g' /opt/lampp/htdocs/admin/includes/dbconnection.php
sudo chmod 777 /opt/lampp/etc/extra/httpd-xampp.conf
sudo sed -i.bak 's/local/ Require all granted/g' /opt/lampp/etc/extra/httpd-xampp.conf
sudo chmod 755 /opt/lampp/etc/extra/httpd-xampp.conf
sudo /opt/lampp/lampp restart
sudo chmod 777 /opt/lampp/phpmyadmin/config.inc.php
sudo echo '$cfg["Servers"][$i]["verbose"] = "Amazon RDS";' >> /opt/lampp/phpmyadmin/config.inc.php
sudo echo '$cfg["Servers"][$i]["host"] = "${endpoint}";' >> /opt/lampp/phpmyadmin/config.inc.php
sudo echo '$cfg["Servers"][$i]["user"] = "admin";' >> /opt/lampp/phpmyadmin/config.inc.php
sudo echo '$cfg["Servers"][$i]["password"] = "${password}";' >> /opt/lampp/phpmyadmin/config.inc.php
sudo echo '$cfg["Servers"][$i]["port"] = "3306";' >> /opt/lampp/phpmyadmin/config.inc.php
sudo echo '$cfg["Servers"][$i]["auth_type"] = "config";' >> /opt/lampp/phpmyadmin/config.inc.php
sudo echo '$cfg["Servers"][$i]["AllowNoPassword"] = true;' >> /opt/lampp/phpmyadmin/config.inc.php
sudo chmod 400 /opt/lampp/phpmyadmin/config.inc.php
sudo /opt/lampp/lampp restart
sudo apt install mysql-client-core-8.0
mysql -h ${endpoint} -u admin -p cpms < /newcpmproject/cpms/SQL File/SQL\ File/cpms.sql
muni1234

