class inspircd::params {

  $version = '3.2.10.4'

  $packages = [
    'build-essential',
    'g++',
    'gcc',

    'pkg-config',
    'libwww-perl',

    # regex
    'libpcre3-dev',
    'libtre-dev'
  ]

  $packages_ldap = [
    'ldap-utils',
    'libldap2-dev'
  ]

  $packages_gnutls = [
    'libgnutls-dev ',
    'gnutls-bin',
  ]

  $packages_openssl = [
    'libssl1.0.0',
    'libssl-dev',
    'openssl',
    'libcurl4-openssl-dev',
  ]

  $packages_geoip = [
    'libgeoip-dev',
  ]

  $user = 'inspircd'
  $service_ensure = 'running'

  case $::osfamily {
    default: {
      $download_dir = '/opt/inspircd_install'

      $epoll = true
      $kqueue = false

      $prefix = "/opt/inspircd/${version}"
      $binary_dir = "${prefix}/bin"
      $module_dir = "${prefix}/module"
      $config_dir = "${prefix}/config"
      $data_dir = "${prefix}/data"
      $log_dir = "${prefix}/log"
    }
  }

}
