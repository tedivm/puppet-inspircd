class inspircd::cron (
  $prefix = $inspircd::params::prefix,
) inherits inspircd::params {

  cron { "inspircd start on boot":
    ensure  => present,
    command => "cd ${prefix}; ./inspircd start  > /dev/null 2>&1",
    special => 'reboot'
  }

  cron { "inspircd ensure running":
    ensure  => present,
    command => "cd ${prefix}; ./inspircd cron  > /dev/null 2>&1",
    minute => '*/2'
  }

}
