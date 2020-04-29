class nagios_notification::install {
  package { "libwww-perl libcrypt-ssleay-perl" :
    ensure => present,
  }
}
