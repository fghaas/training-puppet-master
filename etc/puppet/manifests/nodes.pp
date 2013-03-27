# /etc/puppet/manifests/nodes.pp

node basenode {
  include ntp
}

node daisy inherits basenode {
}
