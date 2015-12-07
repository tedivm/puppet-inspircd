class inspircd::config::ssl (
  $certfile = $inspircd::params::ssl_certfile,
  $keyfile = $inspircd::params::ssl_keyfile,
  $dhfile = undef,
  $cafile = undef,
  $hash = $inspircd::params::ssl_hash,
  $generate = true,
  $module = $inspircd::params::ssl_module,
  $extra_conf = {},
  $add_bind = $inspircd::params::ssl_add_bind,
  $bind_port = $inspircd::params::bind_ssl_port,
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
    ::inspircd::config::bind { 'default ssl port':
      address => $::inspircd::config::bind_ip,
      port    => $bind_port,
      type    => 'clients',
      ssl     => $ssl_bind
    }
  }
}
