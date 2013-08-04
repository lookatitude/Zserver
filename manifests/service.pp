class zserver::service {

    service { "zend-server":
        ensure => "running",
        hasstatus => true,
        hasrestart => true,
        enable => true,
        require => Class["zserver"],
        provider => "init",
    }
}