class inspircd::params {

  $version = '2.0.20'

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

  $services_users = [
    'chanserv',
    'nickserv',
    'memoserv',
    'operserv'
  ]

  $default_modules = [
    'sha256',
    'md5',
    'alias',
    'password_hash',
    'opermotd',
    'spanningtree',

    'banexception',

  ]

  $user = 'inspircd'
  $service_ensure = 'running'

  $motd = ''
  $rules = ''

  $bind_ip = ""
  $bind_port = "6667"
  $bind_ssl_port = "6697"


  $maxnick = "31"
  $maxchan = "64"
  $maxmodes = "20"
  $maxident = "11"
  $maxquit = "255"
  $maxtopic = "307"
  $maxkick = "255"
  $maxgecos = "128"
  $maxaway = "200"


  $groupsize = "10"
  $maxgroups = "100000"
  $maxkeep = "3d"

  $admin = ''
  $nick = ''
  $email = ''


  case $::osfamily {
    default: {
      $epoll = true
      $kqueue = false

      $base_dir = "/opt/inspircd"

      $download_dir = "${base_dir}/downloads"
      $config_dir = "${base_dir}/config"
      $data_dir = "${base_dir}/data"
      $log_dir = "${base_dir}/logs"

      $prefix = "${base_dir}/$version"
      $binary_dir = "${prefix}/bin"
      $module_dir = "${prefix}/module"

      $path_wget = '/usr/bin/wget'
      $path_tar = '/bin/tar'
      $path_make = '/usr/bin/make'

    }
  }

}
