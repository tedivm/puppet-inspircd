class inspircd::install (
  $version = $inspircd::params::version,
  $extra_modules = [],
  $epoll = $inspircd::params::epoll,
  $kqueue = $inspircd::params::kqueue,
  $prefix = $inspircd::params::prefix,
  $binary_dir = $inspircd::params::binary_dir,
  $module_dir = $inspircd::params::module_dir,
  $config_dir = $inspircd::params::config_dir,
  $data_dir = $inspircd::params::data_dir,
  $log_dir = $inspircd::params::log_dir,
  $download_dir = $inspircd::params::download_dir,
) inherits inspircd::params {

  $download = "https://github.com/inspircd/inspircd/archive/v${version}.tar.gz"
  $install_dir = "${download_dir}/inspircd-${version}"

  $gnutls = member($extras, 'ssl_gnutls')
  $openssl = member($extras, 'ssl_openssl')

  file { $download_dir:
    ensure => 'directory',
  }~>

  exec { "inspircd wget":
    command => "wget ${download} -P ${download_dir}",
    creates => "${download_dir}/v${version}.tar.gz",
  }->

  exec { "inspircd untar":
    command => "tar -zxvf ${download_dir}/v${version}.tar.gz -c ${download_dir}",
    creates => $install_dir,
  }->

  file { "${install_dir}/configure.sh":
    content => template('inspircd/configure_modules.erb'),
    mode => '0744',
  }~>

  exec { "inspircd configure":
    command => "${install_dir}/configure.sh",
    cwd => $install_dir,
  }~>

  exec { 'inspircd make':
    command => 'make',
    cwd => $install_dir,
    refreshonly => true,
  }~>

  exec { 'inspircd make install':
    command => 'make install',
    cwd => $install_dir,
    refreshonly => true,
  }

}
