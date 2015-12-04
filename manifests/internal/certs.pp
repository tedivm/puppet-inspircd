class inspircd::internal::certs (
  $certfile,
  $keyfile,
  $user = $::inspircd::config::user,
  $config_dir = $inspircd::config::config_dir,
) inherits inspircd::params {


  $subject = "/C=US/ST=NA/L=NA/O=NA/CN=${::fqdn}"
  $command = "${path_openssl} req -x509 -nodes -newkey rsa:1024 -keyout ${keyfile} -out ${certfile} -nodes -subj \"${subject}\""

  file{ "${config_dir}/ssl":
    ensure => 'directory',
    owner  => $user,
  }->

  exec {'generate inspircd ssl cert':
    command => $command,
    creates => $keyfile,
    user    => $user,
  }->

  file { $keyfile:
    ensure => 'present',
    mode   => '0600',
    owner  => $user
  }
}
