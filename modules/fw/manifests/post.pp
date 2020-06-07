class fw::post {
  firewall { '999 drop all other requests':
    proto => 'all',
    action => 'drop',
    before => undef,
  }
  firewall { '998 drop all ipv6 requests':
    action => 'drop',
    provider => 'ip6tables',
    proto => 'all',
    before => undef,
  }
}
 
