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
    'libgnutls-dev',
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

  $extra_modules_list = [
    'geoip',
    'ldapauth',
    'ldapoper',
    'mssql',
    'mysql',
    'pgsql',
#    'ssl_gnutls',
#    'ssl_openssl',
    'sqlite',
    'sqlauth',
    'sqloper',
  ]

  $user = 'inspircd'
  $service_ensure = 'running'

  $ssl_module = 'gnutls'
  $ssl_hash = 'sha1'

  $motd = ''
  $rules = ''

  $commands = ""
  $femodes = ""
  $chanmodes = ""
  $fakenonexistant = "yes"

  $bind_ip = ""
  $bind_port = "6667"
  $bind_ssl_port = "6697"
  $ssl_add_bind = true

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

  $server = $::fqdn
  $network = $::domain
  $description = ''
  $secret = "secret $::domain"

  $users = "20"
  $oper = "60"

  $ipv4clone = "32"
  $ipv6clone = "128"


  $hostmasks = "no"
  $ipmasks = "no"
  $nickmasks = "no"
  $trigger = "95.5"


  $method = "file"
  $type = "* -USERINPUT -USEROUTPUT"
  $level = "default"


  $netbuffersize = "10240"
  $somaxconn = "128"
  $limitsomaxconn = "true"
  $softlimit = "12800"
  $quietbursts = "yes"
  $nouserdns = "no"


  $announceinvites = "dynamic"
  $hidemodes = "eI"
  $hideulines = "no"
  $flatlinks = "no"
  $hidewhois = ""
  $hidebans = "no"
  $hidekills = ""
  $hidesplits = "no"
  $maxtargets = "20"
  $customversion = ""
  $operspywhois = "no"
  $runasuser = undef
  $runasgroup = undef
  $restrictbannedusers = "yes"
  $genericoper = "no"
  $userstats = "Pu"


  $prefixquit = "Quit: "
  $suffixquit = ""
  $prefixpart = "&quot;"
  $suffixpart = "&quot;"
  $fixedquit = undef
  $fixedpart = undef
  $syntaxhints = "no"
  $cyclehosts = "yes"
  $cyclehostsfromuser = "no"
  $ircumsgprefix = "no"
  $announcets = "yes"
  $allowmismatch = "no"
  $defaultbind = "auto"
  $hostintopic = "yes"
  $pingwarning = "15"
  $serverpingfreq = "60"
  $defaultmodes = "nt"
  $moronbanner = "You're banned! Email abuse@${::domain} with the ERROR line below for help."
  $exemptchanops = "nonick:v flood:o"
  $invitebypassmodes = "yes"
  $nosnoticestack = "no"
  $welcomenotice = "yes"


  case $::osfamily {
    default: {

      $epoll = true
      $kqueue = false

      $base_dir = '/opt/inspircd'

      $download_dir = "${base_dir}/downloads"
      $config_dir = "${base_dir}/config"
      $data_dir = "${base_dir}/data"
      $log_dir = "${base_dir}/logs"

      $prefix = "${base_dir}/${version}"
      $binary_dir = "${prefix}/bin"
      $module_dir = "${prefix}/module"

      $path_wget = '/usr/bin/wget'
      $path_tar = '/bin/tar'
      $path_make = '/usr/bin/make'
      $path_ls = '/bin/ls'
      $path_rm = '/bin/rm'
      $path_openssl = '/usr/bin/openssl'

      $target = "${log_dir}/ircd.log"

      $ssl_certfile = "${config_dir}/ssl/cert.pem"
      $ssl_keyfile = "${config_dir}/ssl/key.pem"

    }
  }

}
