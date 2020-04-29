class nagios_notification {
  file { '/usr/lib/nagios/plugins':
    ensure => present,
    source => 'puppet:///modules/nagios_notification/'
  }
}
