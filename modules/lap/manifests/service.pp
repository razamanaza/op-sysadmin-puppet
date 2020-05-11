class lap::service {
  service {"apache2" :
    ensure => running,
    hasstatus => true,
    hasrestart => true,
    enable => true,
    require => Class["lap::config"],
  }
}
