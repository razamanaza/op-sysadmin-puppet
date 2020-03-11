class vim {
  package { 'vim':
    ensure => present,
  }
  file { '/etc/vim/vimrc.local':
    owner => 'root',
    group => 'root',
    mode => '0644',
    source => 'puppet:///modules/vim/vimrc.local',
    require => Package['vim'],
  }
}
