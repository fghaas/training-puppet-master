#!/bin/bash

cat >> /etc/hosts <<EOF

# added by $0
192.168.122.5 training-puppet-master

192.168.122.111 alice
192.168.122.112 bob
192.168.122.113 charlie
192.168.122.114 daisy
192.168.122.115 eric
192.168.122.116 frank
EOF

cat >> /etc/resolv.conf <<EOF

# added by $0
nameserver 8.8.8.8
nameserver 8.8.4.4
EOF

PROXY="http://training-puppet-master:3128"
export http_proxy=$PROXY
export ftp_proxy=$PROXY
export http_proxy=$PROXY

cat >> /etc/environment <<EOF

# added by $0
http_proxy="$http_proxy"
ftp_proxy="$ftp_proxy"
https_proxy="$https_proxy"
EOF

cp -av /vagrant/puppet /etc
