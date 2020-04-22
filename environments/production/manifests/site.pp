node 'mgmt-b.foo.org.nz' {
  include sudo
  include vim
  include ntp_service
  include puppet
  include users
  include localtimezone
  include nagios
}

node 'back-b.foo.org.nz' {
  include sudo
  include vim
  include ntp_service
  include puppet
  include users
  include localtimezone
  include nrpe_server
}

node 'app-b.foo.org.nz' {
  include sudo
  include vim
  include ntp_service
  include puppet
  include users
  include localtimezone
  include nrpe_server
}

node 'db-b.foo.org.nz' {
	include sudo
  include vim
  include ntp_service
  include mariadb
  include users
  include puppet
  include localtimezone
  include nrpe_server
}


