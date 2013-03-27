#!/bin/bash
rm -Rf /var/lib/puppet/reports/*
rm -Rf /var/lib/puppet/yaml/facts/*
rm -Rf /var/lib/puppet/yaml/node/*
mysql -u root -p'P@ssw0rd' < /opt/training-puppet-master/scripts/reset-puppet-dashboard.sql
cd /usr/share/puppet-dashboard
rake RAILS_ENV=production db:migrate > /dev/null 2>&1
