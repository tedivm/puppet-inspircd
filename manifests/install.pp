class inspircd::install (
  $version = $inspircd::params::version,
  $modules = [],
  $epoll = $inspircd::params::epoll,
  $kqueue = $inspircd::params::kqueue,
  $user = $inspircd::params::user,
  $base_dir = $inspircd::params::base_dir,
  $binary_dir = $inspircd::params::binary_dir,
  $module_dir = $inspircd::params::module_dir,
  $config_dir = $inspircd::params::config_dir,
  $data_dir = $inspircd::params::data_dir,
  $log_dir = $inspircd::params::log_dir,
  $download_dir = $inspircd::params::download_dir,
) inherits inspircd::params {

  $download = "https://github.com/inspircd/inspircd/archive/v${version}.tar.gz"
  $install_dir = "${download_dir}/inspircd-${version}"

  $gnutls = member($modules, 'ssl_gnutls')
  $openssl = member($modules, 'ssl_openssl')

  $compile_extra_modules = intersection($modules, $extra_modules_list)

  file { $base_dir:
    ensure => 'directory',
  }->

  file { $data_dir:
    ensure => 'directory',
    owner  => $user
  }->

  file { $log_dir:
    ensure => 'directory',
    owner  => $user
  }->

  file { "${log_dir}/startup.log":
    ensure => 'file',
    owner  => $user
  }->

  file { $download_dir:
    ensure => 'directory',
  }->

  exec { 'inspircd wget':
    command => "${path_wget} ${download} -P ${download_dir}",
    creates => "${download_dir}/v${version}.tar.gz",
  }~>

  exec { 'inspircd untar':
    command => "${path_tar} -zxvf ${download_dir}/v${version}.tar.gz -C ${download_dir}",
    creates => $install_dir,
  }~>

  file { "${install_dir}/configure_wrapper.sh":
    content => template('inspircd/configure_wrapper.erb'),
    mode    => '0744',
  }~>

  exec { 'inspircd configure':
    command     => "${install_dir}/configure_wrapper.sh",
    cwd         => $install_dir,
    refreshonly => true,
  }~>

  exec { 'inspircd make':
    command     => $path_make,
    cwd         => $install_dir,
    refreshonly => true,
  }~>

  exec { 'inspircd make install':
    command     => "${path_make} install",
    cwd         => $install_dir,
    refreshonly => true,
  }->

  exec { 'inspircd erase examples directory':
    command => "${path_rm} -R ${config_dir}/examples",
    onlyif  => "${path_ls} -1 ${config_dir}/examples"
  }

}
