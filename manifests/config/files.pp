class inspircd::config::files (
  $motd = $inspircd::params::motd,
  $rules = $inspircd::params::rules,
  $user = $inspircd::params::user,
  $config_dir = $inspircd::params::config_dir,
) inherits inspircd::params {

  file { "${config_dir}/motd.txt":
    content => "${motd}\n",
    owner   => $user,
    require => Class['inspircd::install']
  }

  file { "${config_dir}/rules.txt":
    content => "${rules}\n",
    owner   => $user,
    require => Class['inspircd::install']
  }

  concat::fragment { "inspircd config ${name}":
    target  => "${config_dir}/inspircd.conf",
    content => "<files motd=\"${config_dir}/motd.txt\" rules=\"${config_dir}/rules.txt\">\n",
    order   => '11'
  }

}
