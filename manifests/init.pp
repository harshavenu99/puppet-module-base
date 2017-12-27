class base inherits base::params {

    user { 'deploy':
        ensure      => present,
        uid         => 5001, 
        home        => '/home/deploy',
        password    => '$1$Uwp61c55$PQawLElExanc23w2UZb6x1',
        managehome  => true,
    }
    
    user { 'harsha':
        ensure      => present,
        uid         => 5002, 
        home        => '/home/harsha',
        password    => '$1$Uwp61c55$PQawLElExanc23w2UZb6x1',
        managehome  => true,
    }
    
    package { [ 'tree', 'wget', 'git', 'unzip', 'ntp' ]: }
    
    user { 'dojo':
        ensure => absent,
    }
    
    file { '/etc/motd':
        owner   => 'root', 
        group   => 'root',
        mode    => '0644',
        ensure  => present,
        content => "
                This is a propery of XYZ Inc.
                System Info :
                ===========
                Hostname    : ${::hostname}
                IP Address  : ${::ipaddress}
                Memory      : ${::memory['system']['total']}
                Cores       : ${::processors['count']}
                OS          : ${::os['distro']['description']}
            "
    }
    
    service { $::base::ntp_service:
        ensure => running,
        enable => true,
    }
}