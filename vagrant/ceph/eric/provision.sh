#!/bin/bash
echo "192.168.122.5 training-puppet-master" >> /etc/hosts
echo "192.168.122.111 alice" >> /etc/hosts
echo "192.168.122.112 bob" >> /etc/hosts
echo "192.168.122.113 charlie" >> /etc/hosts
echo "192.168.122.114 daisy" >> /etc/hosts
echo "192.168.122.115 eric" >> /etc/hosts
echo "192.168.122.116 frank" >> /etc/hosts

echo "http_proxy=\"http://training-puppet-master:3128/\"" >> /etc/environment
echo "ftp_proxy=\"http://training-puppet-master:3128/\"" >> /etc/environment
echo "https_proxy=\"http://training-puppet-master:3128/\"" >> /etc/environment

cp -a /vagrant/puppet /etc/
