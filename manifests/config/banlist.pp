define inspircd::config::banlist (
  $chan,
  $limit,
  $config_dir = $inspircd::config_dir,
) {

  concat::fragment { "${config_dir}/inspircd.conf banlist ${name}":
    target => "${config_dir}/inspircd.conf",
    content => template('inspircd/config/types/banlist.erb'),
    order   => "16"
  }

}
