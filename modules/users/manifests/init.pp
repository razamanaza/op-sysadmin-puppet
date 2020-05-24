class users {
   user { 'manager':
        name => 'manager',
        ensure => 'present',
        home => '/home/manager',
        shell => '/bin/bash',
    }

    user { 'student':
        name => 'student',
        ensure => 'present',
        home => '/home/student',
        shell => '/bin/bash',
        managehome => true,
        password => '$6$XPXGnTgy$CuYf0jMxIpYZqYCzHeX32x.y1BkiMT8NKVPSGgvxLMoB5u5pCtSt2/tsOkgW7sZSaBt/oP7UgeeVq5ngafLkZ/',
        groups => 'sudo'
    }
}
