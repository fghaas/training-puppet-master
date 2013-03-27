class vagrant-base {
  package { "console-data": ensure => "installed" }
  package { "screen": ensure => "installed" }
  package { "vim": ensure => "installed" }
  package { "less": ensure => "installed" }
  package { "nano": ensure => "installed" }
  package { "rsync": ensure => "installed" }
  class { "ntp": }
}

class ceph-osd-base {
  package { "xfsprogs": ensure => "installed" }
}
