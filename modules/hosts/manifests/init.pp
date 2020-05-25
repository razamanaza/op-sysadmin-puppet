class hosts {
  file { '/etc/hosts':
    owner => 'root',
    group => 'root',
    mode => '0644',
    source => 'puppet:///modules/hosts/hosts',
  }
}
