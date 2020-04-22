class nrpe_server::service {
  service {"nagios-nrpe-server" :
    ensure => running,
    hasstatus => true,
    hasrestart => true,
    enable => true,
    require => Class["nrpe_server::config"],
  }
}
