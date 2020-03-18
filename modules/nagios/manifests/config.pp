class nagios::config {
  file {'/etc/nagios3/nagios.cfg':
    ensure => present,
    source => 'puppet:///modules/nagios/nagios.cfg',
    mode => '0644',
    owner => 'root',
    group => 'root',
    require => Class['nagios::install'],
    notify => Class['nagios::service'],
  }

  file {'/etc/nagios3/htpasswd.users':
    ensure => present,
    source => 'puppet:///modules/nagios/htpasswd.users',
    mode => '0644',
    owner => 'root',
    group => 'root',
    require => Class['nagios::install'],
    notify => Class['nagios::service'],
  }

  file {'/etc/nagios3/conf.d':
    ensure => directory,
    group => 'puppet',
    mode => '0775',
  }

  nagios_host { "db-b.foo.org.nz":
    target => "/etc/nagios3/conf.d/ppt_hosts.cfg",
    alias => "db",
    check_period => "24x7",
    max_check_attempts => 3,
    check_command => "check-host-alive",
    notification_interval => 30,
    notification_period => "24x7",
    notification_options => "d,u,r",
    mode => "0444",
  }
}


