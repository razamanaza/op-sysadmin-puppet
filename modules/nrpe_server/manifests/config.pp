class nrpe_server::config {
  if $hostname == 'mgmt-b' {
    $check_total_procs = "/usr/lib/nagios/plugins/check_procs -w 180 -c 220"
    $check_load = "/usr/lib/nagios/plugins/check_load -r -w .50,.50,.25 -c .60,.60,.30"
    $check_users = "/usr/lib/nagios/plugins/check_users -w 5 -c 10"
  } elsif $hostname == 'app-b' {
    $check_total_procs = "/usr/lib/nagios/plugins/check_procs -w 180 -c 220"
    $check_users = "/usr/lib/nagios/plugins/check_users -w 5 -c 10"
    $check_load = "/usr/lib/nagios/plugins/check_load -r -w .50,.50,.25 -c .60,.60,.30"
  } elsif $hostname == 'db-b' {
    $check_users = "/usr/lib/nagios/plugins/check_users -w 5 -c 10"
    $check_load = "/usr/lib/nagios/plugins/check_load -r -w .50,.50,.25 -c .60,.60,.30"
    $check_total_procs = "/usr/lib/nagios/plugins/check_procs -w 155 -c 200"
  } else {
    $check_users = "/usr/lib/nagios/plugins/check_users -w 5 -c 10"
    $check_load = "/usr/lib/nagios/plugins/check_load -r -w .50,.50,.25 -c .60,.60,.30"
    $check_total_procs = "/usr/lib/nagios/plugins/check_procs -w 150 -c 200"
  }
  
  file {"/etc/nagios/nrpe.cfg":
    ensure => present,
    content => template("nrpe_server/nrpe.cfg.erb"),
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
  file {"/usr/lib/nagios/plugins/bkp_check.sh":
    ensure => present,
    source => "puppet:///modules/nrpe_server/bkp_check.sh",
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
  file {"/usr/lib/nagios/plugins/check_service.sh":
    ensure => present,
    source => "puppet:///modules/nrpe_server/check_service.sh",
    mode => "0755",
    owner => "root",
    group => "root",
    require => Class["nrpe_server::install"],
  }
}
