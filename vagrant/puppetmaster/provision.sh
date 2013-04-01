#!/bin/bash

cat >> /etc/hosts <<EOF

# added by $0
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

apt-get -y install squid3

cat > /etc/squid3/squid.conf <<EOF
http_port 3128
acl everything src 0.0.0.0/0
http_access allow everything
maximum_object_size 1024 MB
cache_replacement_policy heap LFUDA
EOF

PROXY="http://localhost:3128"
export http_proxy=$PROXY
export ftp_proxy=$PROXY
export http_proxy=$PROXY

cat >> /etc/environment <<EOF

# added by $0
http_proxy="$http_proxy"
ftp_proxy="$ftp_proxy"
https_proxy="$https_proxy"
EOF

cat > /etc/apt/apt.conf.d/60proxy <<EOF
# Set by $0
Acquire {
  http {
    Proxy "$http_proxy";
    No-Cache "false";
    Max-Age "604800";     // 1 week age on index files
    No-Store "false";    // Don't Prevent the cache from storing archives
  };
};
EOF

wget http://apt.puppetlabs.com/puppetlabs-release-squeeze.deb
dpkg -i puppetlabs-release-squeeze.deb
apt-get update

apt-get -y install puppetmaster-passenger

cp -av /vagrant/var/lib/puppet /var/lib
cp -av /vagrant/etc/puppet /etc

chown -Rv puppet:puppet /var/lib/puppet /etc/puppet

for m in \
  puppetlabs-apt \
  puppetlabs-mysql puppetlabs-ntp \
  hastexo-location; do
  puppet module install --module_repository http://forge.puppetlabs.com $m
done
