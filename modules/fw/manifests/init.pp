class fw {
  resources { 'firewall':
    purge => true,
  }
  resources { 'firewallchain':
    purge => true,
  }

  Firewall {
    before  => Class['fw::post'],
    require => Class['fw::pre'],
  }

  include fw::pre, fw::post
  
}
