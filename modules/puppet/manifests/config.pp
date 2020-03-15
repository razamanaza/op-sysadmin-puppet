class puppet::config {
  if $hostname == 'mgmt-b' {
    $master_certname = 'certname=mgmt-b.foo.org.nz'
  } else {
    $master_certname = ''
  }
  $certname = $fqdn

  file { '/etc/puppet/puppet.conf':
    ensure => present,
    owner => 'root',
    group => 'root',
    mode => '0644',
    content => template('puppet/puppet.conf.erb'),
  }

}
