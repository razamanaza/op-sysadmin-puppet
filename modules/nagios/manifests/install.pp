class nagios::install {
  package { "nagios3" :
    ensure => present,
    require => User["nagios"],
  }
  package { "nagios-nrpe-plugin" :
    ensure => present,
  }
  package { "libwww-perl" :
    ensure => present,
  }
  package { "libcrypt-ssleay-perl" :
    ensure => present,
  }
  user { "nagios":
    ensure => present,
    comment => "Nagios3 user",
    gid => "nagios",
    shell => "/bin/false",
    require => Group["nagios"],
  }
  group { "nagios" :
    ensure => present,
  }
}

