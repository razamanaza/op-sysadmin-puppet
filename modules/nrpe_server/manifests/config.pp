class nrpe_server::config {
  file {"/etc/nagios/nrpe.cfg":
    ensure => present,
    source => "puppet:///modules/nrpe_server/nrpe.cfg",
    mode => "0444",
    owner => "root",
    group => "root",
    require => Class["nrpe_server::install"],
    notify => Class["nrpe_server::service"],
  }
  file {"/usr/lib/nagios/plugins/logged_users.sh":
    ensure => present,
    source => "puppet:///modules/nrpe_server/logged_users.sh",
    mode => "0755",
    owner => "root",
    group => "root",
    require => Class["nrpe_server::install"],
  }
  file {"/usr/lib/nagios/plugins/nagios_check.sh":
    ensure => present,
    source => "puppet:///modules/nrpe_server/nagios_check.sh",
    mode => "0755",
    owner => "root",
    group => "root",
    require => Class["nrpe_server::install"],
  }
}
