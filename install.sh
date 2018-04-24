#!/usr/bin/env bash

sudo apt-get update
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
sudo apt-get install -y vim curl python-software-properties
sudo apt-get update
sudo apt-get -y install mysql-server
sed -i "s/^bind-address/#bind-address/" /etc/mysql/my.cnf
mysql -u root -proot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION; FLUSH PRIVILEGES; SET GLOBAL max_connect_errors=10000;"
sudo /etc/init.d/mysql restart
#!/usr/bin/env bash
echo "Installing Apache.."
sudo apt-get -y install apache2
echo "Installing Tomcat.."
sudo apt-get -y install tomcat7
echo "Installing tomcat documentation.."
sudo apt-get install tomcat7-docs
echo "Installing Tomcat examples.."
sudo apt-get install tomcat7-examples
echo "Installing Tomcat admin pages.."
sudo apt-get install tomcat7-admin
echo "Installing maven.."
sudo apt-get install -y maven
sudo apt-get install -y software-properties-common python-software-properties
#sudo apt-get oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install -y oracle-java8-installer
sudo apt-get install -y oracle-java8-set-default
sudo cat >> /etc/environment <<EOL
JAVA_HOME=/usr/lib/jvm/java-8-oracle
JRE_HOME=/usr/lib/jvm/java-8-oracle/jre
EOL
#sudo cp /vagrant/hello-spring/target/hello-spring.war /var/lib/tomcat7/webapps/.
#sudo service tomcat7 restart
