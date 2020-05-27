class lap::config {
   $ip = $ipaddress
   
   file {"/etc/apache2/mods-available/dir.conf":
    ensure => present,
    source => "puppet:///modules/lap/dir.conf",
    mode => "0644",
    owner => "root",
    group => "root",
    require => Class["lap::install"],
  }
  file {"/etc/ssl/private/apache-selfsigned.key":
    ensure => present,
    source => "puppet:///modules/lap/apache-selfsigned.key",
    mode => "0600",
    owner => "root",
    group => "root",
    require => Class["lap::install"],
  }
  file {"/etc/ssl/certs/apache-selfsigned.crt":
    ensure => present,
    source => "puppet:///modules/lap/apache-selfsigned.crt",
    mode => "0644",
    owner => "root",
    group => "root",
    require => Class["lap::install"],
  }
  file {"/etc/apache2/conf-available/ssl-params.conf":
    ensure => present,
    source => "puppet:///modules/lap/ssl-params.conf",
    mode => "0644",
    owner => "root",
    group => "root",
    require => Class["lap::install"],
  }
  file {"/etc/apache2/sites-available/default-ssl.conf":
    ensure => present,
    source => "puppet:///modules/lap/default-ssl.conf",
    mode => "0644",
    owner => "root",
    group => "root",
    require => Class["lap::install"],
  }
  file {"/etc/apache2/sites-available/000-default.conf":
    ensure => present,
    content => template("lap/000-default.conf.erb"),
    mode => "0644",
    owner => "root",
    group => "root",
    require => Class["lap::install"],
    notify => Class["lap::service"],
  }
}
