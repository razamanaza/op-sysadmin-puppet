node 'mgmt-b.foo.org.nz' {
  include hosts
  include sudo
  include vim
  include ntp_service
  include puppet
  include users
  include localtimezone
  include nagios
  include nrpe_server
  include nagios_alert_check
}

node 'back-b.foo.org.nz' {
  include hosts
  include sudo
  include vim
  include ntp_service
  include puppet
  include users
  include localtimezone
  include nrpe_server
  include nagios_alert_check
}

node 'app-b.foo.org.nz' {
  include hosts
  include sudo
  include vim
  include ntp_service
  include puppet
  include users
  include localtimezone
  include nrpe_server
  include nagios_alert_check
  include lap
  include own_cloud
  include bkp
}

node 'db-b.foo.org.nz' {
	include hosts
  include sudo
  include vim
  include ntp_service
  include mariadb
  include users
  include puppet
  include localtimezone
  include nrpe_server
  include nagios_alert_check
  include bkp
}


