# /etc/puppet/manifests/nodes.pp

node basenode {
  class { "vagrant": }
}

node daisy inherits basenode {
  class { "ceph-repo": }
  class { "ceph": }
  class { "ceph-osd": }
}

node eric inherits basenode {
  class { "ceph-repo": }
  class { "ceph": }
  class { "ceph-osd": }
}

node frank inherits basenode {
  class { "ceph-repo": }
  class { "ceph": }
  class { "ceph-osd": }
}
