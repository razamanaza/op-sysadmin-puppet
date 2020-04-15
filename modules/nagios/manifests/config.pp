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
  nagios_host { "apps-b.foo.org.nz":
    target => "/etc/nagios3/conf.d/ppt_hosts.cfg",
    alias => "apps",
    check_period => "24x7",
    max_check_attempts => 3,
    check_command => "check-host-alive",
    notification_interval => 30,
    notification_period => "24x7",
    notification_options => "d,u,r",
    mode => "0444",
  }
  nagios_host { "back-b.foo.org.nz":
    target => "/etc/nagios3/conf.d/ppt_hosts.cfg",
    alias => "back",
    check_period => "24x7",
    max_check_attempts => 3,
    check_command => "check-host-alive",
    notification_interval => 30,
    notification_period => "24x7",
    notification_options => "d,u,r",
    mode => "0444",
  }
  nagios_host { "mgmt-b.foo.org.nz":
    target => "/etc/nagios3/conf.d/ppt_hosts.cfg",
    alias => "mgmt",
    check_period => "24x7",
    max_check_attempts => 3,
    check_command => "check-host-alive",
    notification_interval => 30,
    notification_period => "24x7",
    notification_options => "d,u,r",
    mode => "0444",
  }
  nagios_hostgroup {"my-ssh-servers":
    target => "/etc/nagios3/conf.d/ppt_hostgroups.cfg",
    mode => "0444",
    alias => "My SSH servers",
    members => "db-b.foo.org.nz, apps-b.foo.org.nz, back-b.foo.org.nz, mgmt-b.foo.org.nz",
  }
  nagios_hostgroup {"db-servers":
    target => "/etc/nagios3/conf.d/ppt_hostgroups.cfg",
    mode => "0444",
    alias => "Database servers",
    members => "db-b.foo.org.nz",
  }
  nagios_service {"ssh":
    service_description => "ssh servers",
    hostgroup_name => "my-ssh-servers",
    target => "/etc/nagios3/conf.d/ppt_services.cfg",
    check_command => "check_ssh",
    max_check_attempts => 3,
    retry_check_interval => 1,
    normal_check_interval => 5,
    check_period => "24x7",
    notification_interval => 30,
    notification_period => "24x7",
    notification_options => "w,u,c",
    contact_groups => "admins",
    mode => "0444",
  }
  nagios_service {"mariadb":
    service_description => "Maria DB servers",
    hostgroup_name => "db-servers",
    target => "/etc/nagios3/conf.d/ppt_services.cfg",
    check_command => "check_mysql",
    max_check_attempts => 3,
    retry_check_interval => 1,
    normal_check_interval => 5,
    check_period => "24x7",
    notification_interval => 30,
    notification_period => "24x7",
    notification_options => "w,u,c",
    contact_groups => "admins",
    mode => "0444",
  }
}


