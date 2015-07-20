class inspircd::cron (
  $binary_dir = $inspircd::params::binary_dir,
) inherits inspircd::params {

  cron { "inspircd start on boot":
    ensure  => present,
    command => "cd ${binary_dir}; ./inspircd start  > /dev/null 2>&1",
    special => 'reboot'
  }

  cron { "inspircd ensure running":
    ensure  => present,
    command => "cd ${binary_dir}; ./inspircd cron  > /dev/null 2>&1",
    minute => '*/2'
  }

}
