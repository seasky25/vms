#!/usr/bin/env bash

# no need to use sudo as by default privileged is true

#install jdk
#https://www.digitalocean.com/community/tutorials/how-to-install-java-on-ubuntu-with-apt-get
apt-get -y install python-software-properties
add-apt-repository -y ppa:webupd8team/java
apt-get update -y

# Enable silent install
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections

apt-get -y install oracle-java8-installer

# Not always necessary, but just in case...
update-java-alternatives -s java-8-oracle

# Setting Java environment variables
apt-get install -y oracle-java8-set-default
apt-get -y autoremove

# don't use ~/.bashrc as '~' is not recognized during provision
echo 'export JAVA_HOME=/usr/lib/jvm/java-8-oracle' >> /home/vagrant/.bashrc
source /home/vagrant/.bashrc
#echo 'export HADOOP_CLASSPATH=$JAVA_HOME/lib/tools.jar' >> ~/.bashrc


# get hadoop
apt-get -y install curl
curl -O http://apache.claz.org/hadoop/common/hadoop-2.7.3/hadoop-2.7.3.tar.gz

tar xzf hadoop-2.7.3.tar.gz
rm hadoop-2.7.3.tar.gz
echo 'export HADOOP_HOME=/home/vagrant/hadoop-2.7.3' >> /home/vagrant/.bashrc
echo 'export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin' >> /home/vagrant/.bashrc
source /home/vagrant/.bashrc

