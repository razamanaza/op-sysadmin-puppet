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

  file {'/etc/nagios-plugins/config/slack.cfg':
    ensure => present,
    source => 'puppet:///modules/nagios/slack.cfg',
    mode => '0644',
    owner => 'root',
    group => 'root',
    require => Class['nagios::install'],
    notify => Class['nagios::service'],
  }

  file {'/usr/lib/nagios/plugins/nagios.pl':
    ensure => present,
    source => 'puppet:///modules/nagios/nagios.pl',
    mode => '0755',
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
    contact_groups => "slackgroup",
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
    contact_groups => "slackgroup",
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
    contact_groups => "slackgroup",
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
    contact_groups => "slackgroup",
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
  nagios_hostgroup {"puppet-servers":
    target => "/etc/nagios3/conf.d/ppt_hostgroups.cfg",
    mode => "0444",
    alias => "Puppet servers",
    members => "mgmt-b.foo.org.nz",
  }
  nagios_hostgroup {"remote_checks_servers":
    target => "/etc/nagios3/conf.d/ppt_hostgroups.cfg",
    mode => "0444",
    alias => "Remote disks servers",
    members => "db-b.foo.org.nz, apps-b.foo.org.nz, back-b.foo.org.nz, mgmt-b.foo.org.nz",
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
    contact_groups => "slackgroup",
    mode => "0444",
  }
  nagios_service {"mariadb":
    service_description => "Maria DB servers",
    hostgroup_name => "db-servers",
    target => "/etc/nagios3/conf.d/ppt_services.cfg",
    check_command => "check_mysql_cmdlinecred!nagios!12345",
    max_check_attempts => 3,
    retry_check_interval => 1,
    normal_check_interval => 5,
    check_period => "24x7",
    notification_interval => 30,
    notification_period => "24x7",
    notification_options => "w,u,c",
    contact_groups => "slackgroup",
    mode => "0444",
  }
  nagios_service {"remote_disks":
    service_description => "Remote disks",
    hostgroup_name => "remote_checks_servers",
    target => "/etc/nagios3/conf.d/ppt_services.cfg",
    check_command => "check_nrpe!check_sda1",
    max_check_attempts => 3,
    retry_check_interval => 1,
    normal_check_interval => 5,
    check_period => "24x7",
    notification_interval => 30,
    notification_period => "24x7",
    notification_options => "w,u,c",
    contact_groups => "slackgroup",
    mode => "0444",
  }
  nagios_service {"remote_load":
    service_description => "Remote load",
    hostgroup_name => "remote_checks_servers",
    target => "/etc/nagios3/conf.d/ppt_services.cfg",
    check_command => "check_nrpe!check_load",
    max_check_attempts => 3,
    retry_check_interval => 1,
    normal_check_interval => 5,
    check_period => "24x7",
    notification_interval => 30,
    notification_period => "24x7",
    notification_options => "w,u,c",
    contact_groups => "slackgroup",
    mode => "0444",
  }
  nagios_service {"remote_users":
    service_description => "Remote users",
    hostgroup_name => "remote_checks_servers",
    target => "/etc/nagios3/conf.d/ppt_services.cfg",
    check_command => "check_nrpe!check_users",
    max_check_attempts => 3,
    retry_check_interval => 1,
    normal_check_interval => 5,
    check_period => "24x7",
    notification_interval => 30,
    notification_period => "24x7",
    notification_options => "w,u,c",
    first_notification_delay => 0,
    contact_groups => "slackgroup",
    mode => "0444",
  } 
  nagios_service {"remote_zombies":
    service_description => "Remote zombies",
    hostgroup_name => "remote_checks_servers",
    target => "/etc/nagios3/conf.d/ppt_services.cfg",
    check_command => "check_nrpe!check_zombie_procs",
    max_check_attempts => 3,
    retry_check_interval => 1,
    normal_check_interval => 5,
    check_period => "24x7",
    notification_interval => 30,
    notification_period => "24x7",
    notification_options => "w,u,c",
    contact_groups => "slackgroup",
    mode => "0444",
  }
  nagios_service {"remote_processes":
    service_description => "Remote processes",
    hostgroup_name => "remote_checks_servers",
    target => "/etc/nagios3/conf.d/ppt_services.cfg",
    check_command => "check_nrpe!check_total_procs",
    max_check_attempts => 3,
    retry_check_interval => 1,
    normal_check_interval => 5,
    check_period => "24x7",
    notification_interval => 30,
    notification_period => "24x7",
    notification_options => "w,u,c",
    contact_groups => "slackgroup",
    mode => "0444",
  }
  nagios_service {"logged_in_users":
    service_description => "Number of active users",
    hostgroup_name => "remote_checks_servers",
    target => "/etc/nagios3/conf.d/ppt_services.cfg",
    check_command => "check_nrpe!check_logged_users",
    max_check_attempts => 3,
    retry_check_interval => 1,
    normal_check_interval => 1,
    check_interval => 1,
    check_period => "24x7",
    notification_interval => 10,
    notification_period => "24x7",
    notification_options => "w,u,c",
    contact_groups => "slackgroup",
    mode => "0444",
  }
  nagios_service {"backup_check":
    service_description => "Last backup check",
    hostgroup_name => "remote_checks_servers",
    target => "/etc/nagios3/conf.d/ppt_services.cfg",
    check_command => "check_nrpe!check_backup",
    max_check_attempts => 3,
    retry_check_interval => 1,
    normal_check_interval => 1,
    check_interval => 5,
    check_period => "24x7",
    notification_interval => 360,
    notification_period => "24x7",
    notification_options => "w,u,c",
    contact_groups => "slackgroup",
    mode => "0444",
  }

  nagios_service {"nagios_check":
    service_description => "Nagios alerts check",
    hostgroup_name => "remote_checks_servers",
    target => "/etc/nagios3/conf.d/ppt_services.cfg",
    check_command => "check_nrpe!check_nagios_check",
    max_check_attempts => 3,
    retry_check_interval => 1,
    normal_check_interval => 1,
    check_interval => 1,
    check_period => "24x7",
    notification_interval => 10,
    notification_period => "24x7",
    notification_options => "w,u,c",
    contact_groups => "slackgroup",
    mode => "0444",
  }
  nagios_service {"puppet_check":
    service_description => "Puppet client service check",
    hostgroup_name => "remote_checks_servers",
    target => "/etc/nagios3/conf.d/ppt_services.cfg",
    check_command => "check_nrpe!check_puppet",
    max_check_attempts => 3,
    retry_check_interval => 1,
    normal_check_interval => 1,
    check_interval => 1,
    check_period => "24x7",
    notification_interval => 10,
    notification_period => "24x7",
    notification_options => "w,u,c",
    contact_groups => "slackgroup",
    mode => "0444",
  }
  nagios_service {"puppet_master_check":
    service_description => "Puppet master service check",
    hostgroup_name => "puppet-servers",
    target => "/etc/nagios3/conf.d/ppt_services.cfg",
    check_command => "check_nrpe!check_puppet_master",
    max_check_attempts => 3,
    retry_check_interval => 1,
    normal_check_interval => 1,
    check_interval => 1,
    check_period => "24x7",
    notification_interval => 10,
    notification_period => "24x7",
    notification_options => "w,u,c",
    contact_groups => "slackgroup",
    mode => "0444",
  }

  nagios_contact { "slack":
    target => "/etc/nagios3/conf.d/ppt_contacts.cfg",
    alias => "Slack",
    service_notification_period => "24x7",
    host_notification_period => "24x7",
    service_notification_options => "w,u,c,r",
    host_notification_options => "d,r",
    service_notification_commands => "notify-service-by-slack",
    host_notification_commands => "notify-host-by-slack",
    email => "root@localhost",
    mode => "0444",
  }
  nagios_contactgroup { "slackgroup":
    target => "/etc/nagios3/conf.d/ppt_contactgroups.cfg",
    alias => "Slack channel",
    members => "slack",
    mode => "0444",
  }
}


