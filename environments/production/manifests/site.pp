node 'mgmt-b.foo.org.nz' {
  include sudo
  include vim
  include ntp_service
}

node 'back-b.foo.org.nz' {
  include sudo
  include vim
  include ntp_service
}

node 'app-b.foo.org.nz' {
  include sudo
  include vim
  include ntp_service
}

node 'db-b.foo.org.nz' {
	include sudo
  include vim
  include ntp_service
  include mariadb
}


