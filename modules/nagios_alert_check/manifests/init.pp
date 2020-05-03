class nagios_alert_check {
  cron {"nagios_alert_checkfile_morning":
    name => "nagios_alert_checkfile_morning",
    ensure => "present",
    command => "touch /home/student/nagios_check && sleep 300 && rm /home/student/nagios_check",
    hour => 8,
    minute => 00,
    user => "student",
  }
  cron {"nagios_alert_checkfile_evening":
    name => "nagios_alert_checkfile_evening",
    ensure => "present",
    command => "touch /home/student/nagios_check && sleep 300 && rm /home/student/nagios_check",
    hour => 21,
    minute => 50,
    user => "student",
  }
}
