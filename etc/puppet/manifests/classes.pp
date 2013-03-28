class vagrant {
  class { "vagrant-base": }
}

class ceph-repo {
  class { "ceph-repo-base": }
}

class ceph {
  class { "ceph-base": }
}

class ceph-osd {
  class { "ceph-osd-base": }
}
