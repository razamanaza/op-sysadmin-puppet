class lap::install {
  package {"apache2" :
    ensure => present,
  }
  package {"php" :
    ensure => present,
  }
  package {"libapache2-mod-php" :
    ensure => present,
  }
  package {"php-mysql" :
    ensure => present,
  }
}
