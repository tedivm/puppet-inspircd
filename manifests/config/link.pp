define inspircd::config::link (
  $name = '',
  $ipaddr = '',
  $port = '',
  $sid = undef,
  $allowmask = undef,
  $failover = undef,
  $timeout = undef,
  $ssl = undef,
  $bind = undef,
  $statshidden = 'no',
  $hidden = 'no',
  $sendpass = undef,
  $recvpass = undef,
) {

  $config = {
    name => $name,
    ipaddr => $ipaddr,
    port => $port,
    sid => $sid,
    allowmask => $allowmask,
    failover => $failover,
    timeout => $timeout,
    ssl => $ssl,
    bind => $bind,
    statshidden => $statshidden,
    hidden => $hidden,
    sendpass => $sendpass,
    recvpass => $recvpass,
  }

  ::inspircd::internal::configblock { "inspircd link ${name} ":
    config_name => 'link',
    config      => $config,
    section     => 'links',
    order       => '1',
  }

}
