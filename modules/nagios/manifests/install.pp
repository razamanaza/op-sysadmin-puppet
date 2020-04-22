class nagios::install {
  package { "nagios3" :
    ensure => present,
    require => User["nagios"],
  }
  package { "nagios-nrpe-plugin" :
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

