# /etc/puppet/manifests/nodes.pp

node basenode {
  class { "vagrant": }
}

node daisy inherits basenode {
  class { "ceph": }
  class { "ceph-osd": }
}
