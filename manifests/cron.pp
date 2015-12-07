class inspircd::cron (
  $prefix = $inspircd::params::prefix,
) inherits inspircd::params {

  cron { 'inspircd start on boot':
    ensure  => present,
    command => "${prefix}/inspircd start  > /dev/null 2>&1",
    user    => $user,
    special => 'reboot'
  }

  cron { 'inspircd ensure running':
    ensure  => present,
    command => "${prefix}/inspircd cron  > /dev/null 2>&1",
    user    => $user,
    minute  => '*/2'
  }

}
