define inspircd::config::badip (
  $reason,
){

  inspircd::internal::badstuff { "ip ${name}":
      type    => 'ip',
      keyname => 'ipmask',
      content => $name,
      reason  => $reason,
      order   => '24',
  }

}
