class inspircd::config::ssl (
  $certfile = "${::inspircd::config::config_dir}/ssl/cert.pem",
  $keyfile = "${::inspircd::config::config_dir}/ssl/key.pem",
  $dhfile = undef,
  $cafile = undef,
  $hash = "sha1",
  $generate = true,
  $module = $inspircd::params::ssl_module,
  $extra_conf = {},
  $add_bind = false,
  $bind_port = '6697'
) inherits inspircd::params {

  if($module == 'openssl'){
    $sslclass = 'inspircd::modules::openssl'
    $ssl_bind = 'openssl'
  }else{
    $sslclass = 'inspircd::modules::gnutls'
    $ssl_bind = 'gnutls'
  }

  $options = {
    certfile => $certfile,
    keyfile  => $keyfile,
    dhfile   => $dhfile,
    cafile   => $cafile,
    crlfile  => $crlfile,
    generate => $generate,
  }

  $final_options = merge($extra_conf, $options)

  ensure_resource('class', $sslclass, $final_options)

  if($add_bind){
    ::inspircd::config::bind { "default ssl port":
      address => $::inspircd::config::bind_ip,
      port    => $bind_port,
      type    => 'clients',
      ssl     => $ssl_bind
    }
  }
}
