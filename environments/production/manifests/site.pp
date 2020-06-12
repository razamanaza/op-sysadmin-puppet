include fw
include hosts
include sudo
include base
include vim
include ntp_service
include puppet
include users
include localtimezone
include nrpe_server
include nagios_alert_check

node 'mgmt-b.foo.org.nz' {
  include nagios
}

node 'back-b.foo.org.nz' {
  include mariadb
  include bkp
}

node 'app-b.foo.org.nz' {
  include lap
  include own_cloud
  include bkp
}

node 'db-b.foo.org.nz' {
  include mariadb
  include bkp
}


