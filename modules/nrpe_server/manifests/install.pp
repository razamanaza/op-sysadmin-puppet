class nrpe_server::install {
  package {"nagios-nrpe-server" :
    ensure => present,
  }
}
