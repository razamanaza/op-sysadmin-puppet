class mariadb::config {
  file { "/etc/mysql/mariadb.conf.d/50-server.cnf":
      ensure => present,
      source => "puppet:///modules/mariadb/50-server.cnf",
      mode => "0444",
      owner => "root",
      group => "root",
      require => Class["mariadb::install"],
      notify => Class["mariadb::service"],
  }
  firewall { '104 accept mysql for app':  
    proto  => 'tcp',            
    dport => 3306,
    source => '10.25.137.145',
    action => 'accept',         
  }                             
  firewall { '104 accept mysql for mgmt':
    proto  => 'tcp',
    dport => 3306,
    source => '10.25.137.163',
    action => 'accept',
  }
}
