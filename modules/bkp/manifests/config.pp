class bkp::config {
  if $hostname == 'app-b' {
    $filename = "app_bkp.sh"
  } else {
    $filename = "db_bkp.sh"
  }
  
  file { "/home/student/bkp.sh":
      ensure => present,
      source => "puppet:///modules/bkp/${filename}",
      mode => "0755",
      owner => "root",
      group => "root",
  }

  cron {"backup":
    name => "backup",
    ensure => "present",
    command => "/home/student/bkp.sh",
    hour => "*/6",
    minute => 10,
    user => "root",
  }
}
