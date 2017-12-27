class base::params {
    case $::os['family'] {
        'Debian' : {
            $ntp_service = ntp
        }
        'Redhat' : {
            $ntp_service = ntpd
        }
    }
}