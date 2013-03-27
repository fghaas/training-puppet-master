class vagrant-base {
  package { "console-data": ensure => "installed" }
  package { "screen": ensure => "installed" }
  package { "vim": ensure => "installed" }
  package { "less": ensure => "installed" }
  package { "nano": ensure => "installed" }
  package { "rsync": ensure => "installed" }
  class { "ntp": }
}

class ceph-base {
  apt::source { "ceph-bobtail":
      location          => "http://ceph.com/debian-bobtail",
      release           => "squeeze",
      repos             => "main",
      key               => "17ED316D",
      key_server        => "pgp.mit.edu",
      include_src       => false
  }
  package { "ceph":
    ensure => "installed",
    subscribe  => File['/etc/apt/sources.list.d/ceph-bobtail.list'],
  }
}

class ceph-osd-base {
  package { "xfsprogs": ensure => "installed" }
}
