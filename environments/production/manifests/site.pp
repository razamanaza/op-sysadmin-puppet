node 'mgmt-b.foo.org.nz' {
  include sudo
  include vim
  include ntp_service
  include puppet
  include users
}

node 'back-b.foo.org.nz' {
  include sudo
  include vim
  include ntp_service
  include puppet
  include users
}

node 'app-b.foo.org.nz' {
  include sudo
  include vim
  include ntp_service
  include puppet
  include users
}

node 'db-b.foo.org.nz' {
	include sudo
  include vim
  include ntp_service
  include mariadb
  include users
  include puppet
}


