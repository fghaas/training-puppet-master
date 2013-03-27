#!/bin/bash
echo "192.168.122.5 training-puppet-master" >> /etc/hosts
echo "192.168.122.111 alice" >> /etc/hosts
echo "192.168.122.112 bob" >> /etc/hosts
echo "192.168.122.113 charlie" >> /etc/hosts
echo "192.168.122.114 daisy" >> /etc/hosts
echo "192.168.122.115 eric" >> /etc/hosts
echo "192.168.122.116 frank" >> /etc/hosts

cp -a /vagrant/puppet /etc/
