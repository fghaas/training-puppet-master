class vagrant-base {
  package { "console-data": ensure => "installed" }
  package { "screen": ensure => "installed" }
  package { "vim": ensure => "installed" }
  package { "less": ensure => "installed" }
  package { "nano": ensure => "installed" }
  package { "rsync": ensure => "installed" }
  class { "ntp": }
}

class ceph-repo-base {
  apt::source { "ceph-bobtail":
      location          => "http://ceph.com/debian-bobtail",
      release           => "squeeze",
      repos             => "main",
      key               => "17ED316D",
      key_server        => "pgp.mit.edu",
      include_src       => false
  }

  apt::source { "debian-non-free":
      location          => "http://http.us.debian.org/debian",
      release           => "squeeze",
      repos             => "non-free",
      include_src       => false
  }
}

class ceph-base {
  package { "ceph":
    ensure => "installed",
    require  => Class['ceph-repo-base'],
  }
  package { "radosgw":
    ensure => "installed",
    require  => Class['ceph-repo-base'],
  }

  package { "libapache2-mod-fastcgi":
    ensure => "installed",
    require  => Class['ceph-repo-base'],
  }

}

class ceph-osd-base {
  package { "xfsprogs": ensure => "installed" }
}
