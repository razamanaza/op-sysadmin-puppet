class puppet::service {
  service {'puppet':
    ensure => running,
    enable => true,
    require => Class['puppet::config'],
  }
}
