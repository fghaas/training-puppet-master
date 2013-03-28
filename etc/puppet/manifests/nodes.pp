# /etc/puppet/manifests/nodes.pp

node daisy {
  class { "ceph": }
  class { "ceph-packages": }
  class { "ceph-osd": }
}

node eric {
  class { "ceph": }
  class { "ceph-packages": }
  class { "ceph-osd": }
}

node frank {
  class { "ceph": }
  class { "ceph-packages": }
  class { "ceph-osd": }
}
