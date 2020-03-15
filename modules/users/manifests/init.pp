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
    }
}
